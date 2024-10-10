class PractiseAnswerModel {
  String combineId;
  String contestId;
  String gkquestionId;
  String selectedOption;
  bool isCorrect;
  String combineuser;
  Score score;
  String message;

  PractiseAnswerModel({
    required this.combineId,
    required this.contestId,
    required this.gkquestionId,
    required this.selectedOption,
    required this.isCorrect,
    required this.combineuser,
    required this.score,
    required this.message,
  });

  // Factory constructor to create an instance from JSON
  factory PractiseAnswerModel.fromJson(Map<String, dynamic> json) {
    return PractiseAnswerModel(
      combineId: json['combineId'],
      contestId: json['contestId'],
      gkquestionId: json['gkquestionId'],
      selectedOption: json['selectedOption'],
      isCorrect: json['isCorrect'],
      combineuser: json['combineuser'],
      score: Score.fromJson(json['score']),
      message: json['message'],
    );
  }

  // Method to convert the object to JSON
  Map<String, dynamic> toJson() {
    return {
      'combineId': combineId,
      'contestId': contestId,
      'gkquestionId': gkquestionId,
      'selectedOption': selectedOption,
      'isCorrect': isCorrect,
      'combineuser': combineuser,
      'score': score.toJson(),
      'message': message,
    };
  }
}

class Score {
  int contestScore;

  Score({
    required this.contestScore,
  });

  // Factory constructor to create Score instance from JSON
  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      contestScore: json['contestScore'],
    );
  }

  // Method to convert Score object to JSON
  Map<String, dynamic> toJson() {
    return {
      'contestScore': contestScore,
    };
  }
}
