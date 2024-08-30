import 'package:get/get.dart';
import 'package:quizzype001/domain/repository/repository_imports.dart';
import '../../model/Questionmodel/questionModel.dart';

class GkQuizController extends GetxController {
  QuizQuestion? quizQuestion;
  var isLoading = false.obs; // Observable for loading state
  final repository = UserRepository();

  @override
  void onInit() {
    super.onInit();
    getQuestion();
  }

  Future<void> getQuestion() async {
    try {
      isLoading(true); // Set loading to true
      quizQuestion = await repository.fetchQuestion();

      isLoading(false);
    } catch (e) {
      print("Error fetching question: $e");
    } finally {
      isLoading(false); // Set loading to false
    }
  }

  Future<void> getNextQuestion() async {
    await getQuestion();
  }
}
