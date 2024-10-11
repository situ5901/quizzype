import 'package:get/get.dart';
import 'dart:async';
import 'package:quizzype001/domain/repository/repository_imports.dart';
import '../../domain/service/app/app_service_imports.dart';
import '../../model/Questionmodel/questionModel.dart';
import '../../routes/approutes.dart';
import '../widgets/TimesupAppdialog/timesUp.dart';
import '../widgets/quizzDoneAppdiloagbox/DoneDiloagbox.dart';
import '../../model/ContestModel/contest_model.dart';

class PracticeScreenController extends GetxController {
  QuizQuestion? quizQuestion;
  final DatabaseService databaseService = Get.find<DatabaseService>();
  bool isLoading = true;
  final repository = UserRepository();
  String? gkQuestionId;
  String? selectedOption;
  int score = 0; // Use int for score to handle numerical operations
  Timer? timer;
  int timeLeft = 15; // 15 seconds per question
  double progress = 1.0;
  int questionNumber = 1; // Current question number
  bool isQuizCompleted = false;
  Contest? contest; // To hold contest details
  String? contestId;


  @override
  InternalFinalCallback<void> get onDelete => super.onDelete;
  @override
  void onInit() {
    super.onInit();
    contestId = Get.arguments;
    print("Contest ID: $contestId");
    loadData().then((_) {
      startTimer();
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  Future<void> getQuestion() async {
    try {
      quizQuestion = await repository.fetchPracticeQuestion();
      gkQuestionId = quizQuestion?.id; // Ensure this is a String
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
        final updatedScore = await repository.postPracticeAnswer(
          gkQuestionId!,
          selectedOption!,
          contestId!,
        );

        if (updatedScore != null) {
          score += updatedScore; // Update the score with the new score
          update(); // Notify the UI about the score update
        }
      } catch (e) {
        print("Error posting answer: $e");
      }
    } else {
      print("gkQuestionId or selectedOption is null");
    }
  }

  Future<void> loadData() async {
    await Future.wait([getNextQuestion()]); // Ensure we get the next question
    isLoading = false;
    update();
  }

  Future<void> getNextQuestion() async {
    await getQuestion(); // Fetch the question
    startTimer(); // Start the timer for the new question
  }

  void selectOption(String option) {
    selectedOption = option; // Select the option
    update(); // Update the UI
  }

  Future<void> handleNextQuestion() async {
    if (selectedOption != null) {
      await postAnswer(); // Post the current answer
      if (questionNumber < 10) {
        questionNumber++;
        await loadData(); // Load next question
        startTimer(); // Start the timer for the next question
      } else {
        timer?.cancel(); // Cancel any existing timer to avoid multiple instances
        Get.dialog(
          DoneDialog(
            score: score, // Use the int score directly
            onTap: () {
              onClose();
              Get.back();
              Get.offAllNamed(AppRoutes.homeScreen); // Navigate to score screen
            },
          ),
          barrierDismissible: false,
        );
        // Handle quiz completion, for example, show the results dialog
      }
    }
  }

  void startTimer() {
    print("Starting timer...");
    timeLeft = 15;
    progress = 1.0;
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        timeLeft--;
        progress = timeLeft / 15; // Update progress
        update(); // Update the UI
      } else {
        timer.cancel();
        handleTimeUp();
      }
    });
  }

  void handleTimeUp() async {
    await postAnswer(); // Post answer when time is up
    if (questionNumber < 10) {
      questionNumber++;
      await loadData(); // Load next question
      startTimer(); // Start the timer for the next question
    } else {
      if (Get.context != null) {
        Get.dialog(
          TimesUpDialog(
            score: score, // Use the int score directly
            onTap: () {
              Get.back();
              onClose();
              Get.offNamed(AppRoutes.homeScreen); // Navigate to score screen
            },
          ),
          barrierDismissible: false,
        );
      }
    }
  }
}
