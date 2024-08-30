class QuizQuestion {
  String id;
  String question;
  String correctAnswer;
  List<String> options;


  QuizQuestion({
    required this.id,
    required this.question,
    required this.correctAnswer,
    required this.options,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      id: json['_id'] as String,
      question: json['question'] as String,
      correctAnswer: json['correctAnswer'] as String,
      options: (json['options'] as List<dynamic>).map((option) => option.toString().trim()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'question': question,
      'correctAnswer': correctAnswer,
      'options': options,
    };
  }
}
