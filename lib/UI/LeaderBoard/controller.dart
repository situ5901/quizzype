import 'package:get/get.dart';
import '../../domain/repository/repository_imports.dart';
import '../../model/leaderboard/leaderBoard.dart';

class LeaderboardController extends GetxController {
  var isLoading = true.obs; // Use .obs to make it an observable
  var leaderboardData = <TopUser>[].obs; // Use .obs to make it an observable list

  final UserRepository repository = UserRepository();

  @override
  void onInit() {
    fetchLeaderboard();
    super.onInit();
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
