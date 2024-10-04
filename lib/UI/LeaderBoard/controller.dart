import 'package:get/get.dart';
import '../../domain/repository/repository_imports.dart';
import '../../domain/service/app/app_service_imports.dart';
import '../../model/leaderboard/leaderBoard.dart';
class LeaderboardController extends GetxController {
  var isLoading = true.obs;
  var leaderboardData = <TopUser>[].obs;
  var currentUserRank = (-1).obs; // Variable to store the current user's rank
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
      leaderboardData.value = topUsersResponse.topUsers;

      // Fetch the current user's ID from the database
      var db = Get.find<DatabaseService>();
      var currentUser = db.user;

      if (currentUser?.id != null) {
        print('Current User ID: ${currentUser?.id?.trim()}');

        // Compare currentUser.id with leaderboard combineId
        for (int i = 0; i < leaderboardData.length; i++) {
          print("Leaderboard combineId: ${leaderboardData[i].combineId.trim()}");

          // Compare currentUser's id with leaderboard user's combineId
          if (leaderboardData[i].combineId.trim() == currentUser?.id?.trim()) {
            currentUserRank.value = i + 1; // Rank is 1-based
            print("Found user at rank: ${currentUserRank.value}");
            break;
          }
        }

        if (currentUserRank.value == -1) {
          print("User not found in the leaderboard");
        } else {
          print("Current user rank: ${currentUserRank.value}");
        }
      }
    } catch (e) {
      print("Exception fetching leaderboard: $e");
    } finally {
      isLoading.value = false;
    }
  }



}

