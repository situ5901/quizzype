import 'dart:async';
import 'package:get/get.dart';
import 'package:quizzype001/domain/repository/repository_imports.dart';
import '../../domain/service/app/app_service_imports.dart';
import '../../model/Questionmodel/questionModel.dart';
import '../../routes/approutes.dart';

class GkQuizController extends GetxController {
  QuizQuestion? quizQuestion;
  final DatabaseService databaseService = Get.find<DatabaseService>();
  bool isLoading = true;
  final repository = UserRepository();

  String? gkQuestionId;
  String? selectedOption;
  String? score;

  Timer? timer;
  int timeLeft = 60; // Countdown timer in seconds
  double progress = 1.0; // Initial value for the circular progress indicator

  @override
  void onInit() {
    super.onInit();
    loadData();
    startTimer(); // Start the timer when the controller is initialized
  }

  @override
  void onClose() {
    timer?.cancel(); // Cancel the timer when the controller is closed
    super.onClose();
  }

  Future<void> getQuestion() async {
    try {
      quizQuestion = await repository.fetchQuestion();
      gkQuestionId = quizQuestion?.id;  // Set the question ID from fetched question
      isLoading = false;
    } catch (e) {
      print("Error fetching question: $e");
      isLoading = false;
    }
  }

  Future<void> postAnswer() async {
    if (gkQuestionId != null && selectedOption != null) {
      try {
        print("Posting answer: $selectedOption for question ID: $gkQuestionId");
        await repository.postAnswer(gkQuestionId!, selectedOption!);
      } catch (e) {
        print("Error posting answer: $e");
      }
    } else {
      print("gkQuestionId or selectedOption is null");
    }
  }

  Future<void> loadData() async {
    await Future.wait([getNextQuestion()]);
    isLoading = false;
    update();
  }

  Future<void> getNextQuestion() async {
    await getQuestion();
  }

  void selectOption(String option) {
    selectedOption = option;  // Set the selected option
    update();  // This should trigger the UI to update after the option is selected
  }

  Future<void> getScore() async {
    await repository.getScore();
    score = databaseService.isScore;  // Fetch the score
    update();  // Trigger the UI update
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        timeLeft--; // Decrease the time
        progress = timeLeft / 60; // Update the progress for circular indicator
        update(); // Update the UI
      } else {
        timer.cancel();
        Get.offNamed(AppRoutes.leaderBoard); // Navigate to home screen after 60 seconds
      }
    });
  }
}
