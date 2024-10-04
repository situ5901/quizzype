import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quizzype001/domain/repository/repository_imports.dart';
import '../../domain/service/app/app_service_imports.dart';
import '../../model/Questionmodel/questionModel.dart';
import '../../routes/approutes.dart';
import '../widgets/TimesupAppdialog/timesUp.dart';
import '../widgets/quizzDoneAppdiloagbox/DoneDiloagbox.dart';

class GkQuizController extends GetxController {
  QuizQuestion? quizQuestion;
  final DatabaseService databaseService = Get.find<DatabaseService>();
  bool isLoading = true;
  final repository = UserRepository();

  String? gkQuestionId;
  String? selectedOption;
  String score = "0";

  Timer? timer;
  int timeLeft = 15; // 15 seconds per question
  double progress = 1.0;
  int questionNumber = 1;  // Current question number
  bool isQuizCompleted = false;

  // Store the contest ID
  String? contestId;

  @override
  void onInit() {
    super.onInit();
    // Retrieve the contest ID from the arguments
    contestId = Get.arguments ; // Assuming contest ID is passed as String
    print("Contest ID: $contestId"); // For debugging
    loadData();
    startTimer();
  }

  @override
  void onClose() {
    timer?.cancel(); // Cancel any existing timer
    super.onClose();
  }

  Future<void> getQuestion() async {
    try {
      quizQuestion = await repository.fetchQuestion(); // Fetch question based on contest ID if needed
      gkQuestionId = quizQuestion?.id;
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
        await repository.postAnswer(gkQuestionId!, selectedOption!,contestId!);
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
    selectedOption = option;
    update();
  }

  Future<void> getScore() async {
    score = await repository.getScore(contestId!);
    update();
  }

  Future<void> handleNextQuestion() async {
    if (selectedOption != null) {
      await postAnswer(); // Post the current answer
      if (questionNumber < 10) {
        questionNumber++;
        await loadData(); // Load next question
        startTimer(); // Start the timer for the next question
      } else {
        await getScore();
        Get.dialog(
          DoneDialog(
            score: int.parse(score),
          ),
          barrierDismissible: false,
        );
        // Handle quiz completion, for example, show the results dialog
      }
    }
  }

  void startTimer() {
    timeLeft = 15; // Reset to 15 seconds
    progress = 1.0; // Reset progress

    timer?.cancel(); // Cancel any existing timer to avoid multiple instances

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        timeLeft--; // Decrease time
        progress = timeLeft / 15; // Update progress
        update();
      } else {
        // Handle time up
        timer.cancel();
        handleTimeUp();
      }
    });
  }

  void handleTimeUp() async {
    await postAnswer();
    if (questionNumber < 10) {
      questionNumber++;
      await loadData(); // Load next question
      startTimer(); // Restart the timer
    } else {
      await getScore();
      if (Get.context != null) {
        Get.dialog(
          TimesUpDialog(
            score: int.parse(score),
          ),
          barrierDismissible: false,
        );
      }
    }
  }
}
