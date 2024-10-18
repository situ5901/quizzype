import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'dart:async'; // Import for Timer
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../domain/repository/repository_imports.dart';
import '../../domain/service/app/app_service_imports.dart';
import '../../model/ContestModel/contest_model.dart';
import '../../routes/approutes.dart';
class Competitve extends GetxController{

  final repository = UserRepository();
  String balance = "0"; // Initialize with "0"
  var contests = <Contest>[].obs; // List to store contests
  Timer? _timer; // Timer for refreshing contests
  String? currentuser;
  bool isLoading = true;
  String? currentusername;
  var db = Get.find<DatabaseService>();
  int _fetchInterval = 1; // Initial fetch interval
  var players = <String>[].obs; // List to store players in the contest
  bool showWaitingMessage =true;
  @override
  void onInit() {
    super.onInit();
    currentuser = db.user!.id;
    currentusername = db.user!.fullname;
    load();
    getContest(); // Fetch contests initially
  }

  @override
  void onClose() {
    _timer?.cancel(); // Stop the timer when the controller is closed
    super.onClose();
  }

  void load() async {
    await getBalance();
  }

  Future<void> getBalance() async {
    try {
      balance = await repository.getWalletBalance();
      print("Balance: $balance");
      update(); // Notify listeners of the updated balance
    } catch (e) {
      print("Error fetching balance: $e");
    }
  }

  Future<void> getContest() async {
    try {
      final response = await repository.getCompContest();
      if (response != null) {
        var newContests = (response['contests'] as List<dynamic>)
            .map<Contest>((json) => Contest.fromJson(json))
            .toList();

        if (!listEquals(contests, newContests)) {
          contests.value = newContests;
          print("Contests fetched: ${contests.length}");
          _fetchInterval = 10; // Reset interval on new data
          isLoading = false;
        } else {
          _fetchInterval = (_fetchInterval * 2).clamp(30, 120);
          isLoading = false;
        }
      } else {
        print("No contests found");
        isLoading = false;
      }
      isLoading = false;

    } catch (e) {
      isLoading = false;
      print("Error fetching Contest: $e");
    }
  }

  // In your controller or the relevant place
  void checkPlayerStatus(String contestId) async {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      try {
        final contestDetails = await repository.getCompContestDetail(contestId);

        if (contestDetails.contests.isNotEmpty) {
          var currentContest = contestDetails.contests.first;

          // Update players list
          players.value = currentContest.players.map((player) => player.fullname).toList();

          // Check if there are 2 players, including the current user
          if (currentContest.players.length == 2 &&
              currentContest.players.any((player) => player.combineId == currentuser)) {
            timer.cancel(); // Stop polling

            // Wait for 3 seconds and then navigate
            Future.delayed(Duration(seconds: 3), () {
              Get.back(); // Close the dialog
              Get.offNamed(AppRoutes.compQuest, arguments: contestId); // Navigate to GK questions
            });
          }

          // Update the waiting message state
          if (currentContest.players.length >= 2) {
            showWaitingMessage = false; // Update this variable in your controller
          }
        }
      } catch (e) {
        print("Error checking player status: $e");
      }
    });
  }


  Future<void> joinGame(String contestId) async {
    try {
      await repository.joinCompetitiveGame(contestId);
      print("Joined contest: $contestId");
      players.clear(); // Clear the previous players
      checkPlayerStatus(contestId);
    } catch (e) {
      print("Error joining Contest: $e");
    }
  }

  void refreshContests() {
    getContest();
  }

  void startAutoRefresh() {
    _timer = Timer.periodic(Duration(seconds: _fetchInterval), (timer) {
      getContest();
    });
  }
}