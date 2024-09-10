// Model for the top user
class TopUser {
  final String id;
  final String combineId;
  final int score;
  final String combineUser;
  final int wallet;
  final int v;

  TopUser({
    required this.id,
    required this.combineId,
    required this.score,
    required this.combineUser,
    required this.wallet,
    required this.v,
  });

  // Factory method to create a TopUser from a JSON map
  factory TopUser.fromJson(Map<String, dynamic> json) {
    return TopUser(
      id: json['_id'],
      combineId: json['combineId'],
      score: json['score'],
      combineUser: json['combineuser'],
      wallet: json['Wallet'],
      v: json['__v'],
    );
  }

  // Method to convert a TopUser to a JSON map
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'combineId': combineId,
      'score': score,
      'combineuser': combineUser,
      'Wallet': wallet,
      '__v': v,
    };
  }
}

// Model for the response that contains a list of top users
class TopUsersResponse {
  final List<TopUser> topUsers;

  TopUsersResponse({required this.topUsers});

  // Factory method to create a TopUsersResponse from a JSON map
  factory TopUsersResponse.fromJson(Map<String, dynamic> json) {
    var list = json['topUsers'] as List;
    List<TopUser> topUsersList = list.map((i) => TopUser.fromJson(i)).toList();
    return TopUsersResponse(topUsers: topUsersList);
  }

  // Method to convert a TopUsersResponse to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'topUsers': topUsers.map((user) => user.toJson()).toList(),
    };
  }
}
