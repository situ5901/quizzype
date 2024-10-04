import 'dart:async'; // Import for Timer
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
 String? currentuser;
  var db = Get.find<DatabaseService>();
  @override
  void onInit() {
    super.onInit();
     currentuser = db.user!.fullname;
    load();
    getContest(); // Fetch contests initially
    startAutoRefresh(); // Start auto-refreshing contests
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
      final response = await repository.getContest();
      if (response != null) {
        //print("API Response: $response"); // Print the entire response
        contests.value = (response['contests'] as List<dynamic>)
            .map<Contest>((json) => Contest.fromJson(json))
            .toList();
        print("Contests fetched: ${contests.length}");
      } else {
        print("No contests found");
      }
    } catch (e) {
      print("Error fetching Contest: $e");
    }
  }

  Future<void> joinGame(String contestId) async {
    try {
      await repository.joingame(contestId);
      print("Joined contest: $contestId");
    } catch (e) {
      print("Error joining Contest: $e");
    }
  }

  // Start auto-refreshing contests every 10 seconds
  void startAutoRefresh() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      getContest(); // Fetch contests every 10 seconds
    });
  }
}