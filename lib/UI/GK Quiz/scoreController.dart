import 'package:get/get.dart';
import '../../domain/repository/repository_imports.dart';
import '../../model/ContestModel/contest_model.dart';

class ShowScoreController extends GetxController {
  String? contestId;
  final repository = UserRepository();
  late Contest contest; // To hold contest details
  late String winnerName;
  late String loserName;
  late int winnerScore;
  late int loserScore;
  bool isLoading = true; // Add loading state
  @override
  void onInit() {
    contestId = Get.arguments; // Assuming contest ID is passed as String
    print("Contest ID: $contestId"); // For debugging
    getContestDetails();
    super.onInit();
  }

  Future<void> getContestDetails() async {
    final contestDetails = await repository.getContestDetail(contestId!);
    contest = contestDetails.contests.first; // Assuming we only care about the first contest
    update(); // Update the UI after fetching details
    checkWinner(); // Call checkWinner after getting contest details
    isLoading = false;
  }

  Future<void> checkWinner() async {
    if (contest.players.isNotEmpty) {
      // Assuming you have at least two players to compare
      var player1 = contest.players[0];
      var player2 = contest.players[1];

      if (player1.score > player2.score) {
        winnerName = player1.fullname;
        winnerScore = player1.score;
        loserName = player2.fullname;
        loserScore = player2.score;
      } else {
        winnerName = player2.fullname;
        winnerScore = player2.score;
        loserName = player1.fullname;
        loserScore = player1.score;
      }

      // Call the repository method to check the winner if needed
      await repository.CheckWinnder(
        contestId: contestId!,
        combineID1: player1.combineId,
        combineID2: player2.combineId,
        amount: contest.winningAmount.toString(),
      );

      update(); // Update the UI after determining the winner
    }
  }
}
