import 'package:get/get.dart';
import 'package:quizzype001/domain/repository/repository_imports.dart';
import '../../domain/service/app/app_service_imports.dart';
import '../../model/Questionmodel/questionModel.dart';

class GkQuizController extends GetxController {
  QuizQuestion? quizQuestion;
  final DatabaseService databaseService = Get.find<DatabaseService>();
  bool isLoading = true;
  final repository = UserRepository();

  String? gkQuestionId;
  String? selectedOption;
  String? score;


  @override
  void onInit() {
    super.onInit();
 //   getContestId();
    loadData();
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
      print("gkQuestionId or selectedOption is null");  // Already prints this, but double-check here
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


}
