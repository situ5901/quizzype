import 'dart:async'; // Import for Timer
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../domain/repository/repository_imports.dart';
import '../../domain/service/app/app_service_imports.dart';
import '../../model/ContestModel/contest_model.dart';
import '../../routes/approutes.dart';

class GkContestController extends GetxController {
  final repository = UserRepository();
  String balance = "0"; // Initialize with "0"
  var contests = <Contest>[].obs; // List to store contests
  Timer? _timer; // Timer for refreshing contests
  Timer? _joinTimer; // Timer for joining users
  String? currentuser;
  var db = Get.find<DatabaseService>();
  int _fetchInterval = 1; // Initial fetch interval
  var players = <String>[].obs; // List to store players in the contest

  @override
  void onInit() {
    super.onInit();
    currentuser = db.user!.fullname;
    load();
    getContest(); // Fetch contests initially
  }

  @override
  void onClose() {
    _timer?.cancel(); // Stop the timer when the controller is closed
    _joinTimer?.cancel(); // Stop the join timer when the controller is closed
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
      final response = await repository.getContest();
      if (response != null) {
        var newContests = (response['contests'] as List<dynamic>)
            .map<Contest>((json) => Contest.fromJson(json))
            .toList();

        if (!listEquals(contests, newContests)) {
          contests.value = newContests;
          print("Contests fetched: ${contests.length}");
          _fetchInterval = 10; // Reset interval on new data
        } else {
          _fetchInterval = (_fetchInterval * 2).clamp(30, 120);
        }
      } else {
        print("No contests found");
      }
    } catch (e) {
      print("Error fetching Contest: $e");
    }
  }

  Future<void> checkPlayerStatus(String contestId) async {
    // Start a timer for 10 seconds to check if a player joins
    _joinTimer = Timer(Duration(seconds: 10), () {
      // Redirect to GK questions if no players join
      Get.offNamed(AppRoutes.gK_Question, arguments: contestId);
    });

    Timer.periodic(Duration(seconds: 1), (timer) async {
      try {
        final contestDetails = await repository.getContestDetail(contestId);

        if (contestDetails.contests.isNotEmpty) {
          var currentContest = contestDetails.contests.first;

          // Update players list
          players.value =
              currentContest.players.map((player) => player.fullname).toList();

          // Check if current user is a player and if there are exactly 2 players
          if (currentContest.players
              .any((player) => player.fullname == currentuser) &&
              currentContest.players.length == 2) {
            timer.cancel(); // Stop polling
            _joinTimer?.cancel(); // Cancel the join timer
            Get.back(); // This will close the dialog

            Get.offNamed(AppRoutes.gK_Question,
                arguments: contestId); // Navigate to GK questions
          }
        }
      } catch (e) {
        print("Error checking player status: $e");
      }
    });
  }

  Future<void> joinGame(String contestId) async {
    try {
      await repository.joingame(contestId);
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
