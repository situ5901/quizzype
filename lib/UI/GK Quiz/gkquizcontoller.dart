import 'package:get/get.dart';
import 'package:quizzype001/domain/repository/repository_imports.dart';
import '../../model/Questionmodel/questionModel.dart';

class GkQuizController extends GetxController {
  QuizQuestion? quizQuestion;
  bool isLoading = true; // Observable for loading state
  final repository = UserRepository();


  @override
  void onInit() {
    super.onInit();
    loadData();
  }


  Future<void> getQuestion() async {
    try {
      quizQuestion = await repository.fetchQuestion();

      isLoading = false;
    } catch (e) {
      print("Error fetching question: $e");
      isLoading = false;
    }
  }


  Future<void> loadData() async {
    await Future.wait([
      getNextQuestion()
    ]);
    isLoading = false;
    update();
  }
  Future<void> getNextQuestion() async {
    await getQuestion();
  }
}
