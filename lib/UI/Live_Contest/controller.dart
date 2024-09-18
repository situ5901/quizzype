import 'package:get/get.dart';
import 'package:quizzype001/domain/service/app/app_service_imports.dart';
import 'package:quizzype001/model/UserModels/UserModel.dart';
import '../../domain/repository/repository_imports.dart';
import '../../model/leaderboard/leaderBoard.dart';

class LiveController extends GetxController {
  var db = Get.find<DatabaseService>(); // Finding the DatabaseService
final repository = UserRepository();
  String balance = "0"; // Default balance as string

  var isLoading = true.obs; // Use .obs to make it an observable
  var leaderboardData = <TopUser>[].obs; // Use .obs to make it an observable list
  @override
  void onInit() {
    super.onInit();

    load();     // Fetch balance
    update();
  }

  void load() {
    getBalance();
    fetchLeaderboard();
    update();
  }
  @override
  void onReady() {
    super.onReady();
    load();
    fetchLeaderboard();
    update();

  }

  Future<void> getBalance() async {
    try {
      balance = await repository.getWalletBalance() ?? "0"; // Ensuring balance is not null
      print("Balance fetched: $balance");
      update();  // Update the UI after the balance is fetched
    } catch (e) {
      print("Error fetching balance: $e");
    }
  }

  Future<void> fetchLeaderboard() async {
    try {
      final response = await repository.getLeaderBoard();
      final topUsersResponse = TopUsersResponse.fromJson(response);
      leaderboardData.value = topUsersResponse.topUsers; // Update observable list
    } catch (e) {
      print("Exception fetching leaderboard: $e");
    } finally {
      isLoading.value = false; // Update observable
    }
  }
}
