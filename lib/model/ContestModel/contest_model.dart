class ContestResponse {
  List<Contest> contests;
  String message;

  ContestResponse({required this.contests, required this.message});

  factory ContestResponse.fromJson(Map<String, dynamic> json) {
    var contestsList = json['contests'] as List<dynamic>? ?? []; // Use empty list if null
    List<Contest> contestObjects = contestsList.map((contest) => Contest.fromJson(contest)).toList();

    return ContestResponse(
      contests: contestObjects,
      message: json['message'] ?? '',  // Handle message field if present
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contests': contests.map((contest) => contest.toJson()).toList(),
      'message': message,
    };
  }
}

class Contest {
  String contestId;
  bool isFull;
  ContestDetails contestDetails;
  int gameAmount;

  Contest({
    required this.contestId,
    required this.isFull,
    required this.contestDetails,
    required this.gameAmount,
  });

  factory Contest.fromJson(Map<String, dynamic> json) {
    return Contest(
      contestId: json['contestId'] ?? '',  // Default to empty string if null
      isFull: json['isFull'] ?? false, // Default to false if null
      contestDetails: ContestDetails.fromJson(json['contestDetails']),
      gameAmount: json['gameAmount'] ?? 0, // Default to 0 if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contestId': contestId,
      'isFull': isFull,
      'contestDetails': contestDetails.toJson(),
      'gameAmount': gameAmount,
    };
  }
}

class ContestDetails {
  List<CombineId> combineId;

  ContestDetails({required this.combineId});

  factory ContestDetails.fromJson(Map<String, dynamic> json) {
    var combineIdList = json['combineId'] as List<dynamic>? ?? []; // Use empty list if null
    List<CombineId> combineIdObjects = combineIdList.map((combine) => CombineId.fromJson(combine)).toList();

    return ContestDetails(
      combineId: combineIdObjects,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'combineId': combineId.map((combine) => combine.toJson()).toList(),
    };
  }
}

class CombineId {
  List<ParentArray> parentArray;

  CombineId({required this.parentArray});

  factory CombineId.fromJson(Map<String, dynamic> json) {
    var parentArrayList = json['__parentArray'] as List<dynamic>? ?? []; // Use empty list if null
    List<ParentArray> parentArrayObjects = parentArrayList.map((parent) => ParentArray.fromJson(parent)).toList();

    return CombineId(
      parentArray: parentArrayObjects,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '__parentArray': parentArray.map((parent) => parent.toJson()).toList(),
    };
  }
}

class ParentArray {
  String id;
  String fullname;
  int score;
  String combineId;

  ParentArray({
    required this.id,
    required this.fullname,
    required this.score,
    required this.combineId,
  });

  factory ParentArray.fromJson(Map<String, dynamic> json) {
    return ParentArray(
      id: json['id'] ?? '', // Default to empty string if null
      fullname: json['fullname'] ?? '', // Default to empty string if null
      score: json['score'] ?? 0, // Default to 0 if null
      combineId: json['_id'] ?? '', // Default to empty string if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullname,
      'score': score,
      '_id': combineId,
    };
  }
}
