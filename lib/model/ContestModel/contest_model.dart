class ContestResponse {
  List<Contest> contests;
  String message;

  ContestResponse({required this.contests, this.message = ''});

  factory ContestResponse.fromJson(Map<String, dynamic> json) {
    var contestsList = json['contests'] as List<dynamic>? ?? [];
    List<Contest> contestObjects = contestsList.map((contest) => Contest.fromJson(contest)).toList();

    return ContestResponse(
      contests: contestObjects,
      message: json['message'] ?? '',
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
  int gameAmount;
  int winningAmount;
  List<Player> players;

  Contest({
    required this.contestId,
    required this.isFull,
    required this.gameAmount,
    required this.winningAmount,
    required this.players,
  });

  factory Contest.fromJson(Map<String, dynamic> json) {
    var playersList = json['players'] as List<dynamic>? ?? [];
    List<Player> playerObjects = playersList.map((player) => Player.fromJson(player)).toList();

    return Contest(
      contestId: json['contestId'] ?? '',
      isFull: json['isFull'] ?? false,
      gameAmount: json['gameAmount'] ?? 0,
      winningAmount: json['winningAmount'] ?? 0,
      players: playerObjects,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contestId': contestId,
      'isFull': isFull,
      'gameAmount': gameAmount,
      'winningAmount': winningAmount,
      'players': players.map((player) => player.toJson()).toList(),
    };
  }
}

class Player {
  String combineId;
  int score;
  String fullname;

  Player({required this.combineId, required this.score, required this.fullname});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      combineId: json['combineId'] ?? '',
      score: json['score'] ?? 0,
      fullname: json['fullname'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'combineId': combineId,
      'score': score,
      'fullname': fullname,
    };
  }
}
