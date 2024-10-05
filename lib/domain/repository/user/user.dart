part of 'package:quizzype001/domain/repository/repository_imports.dart';

class UserRepository {
  final UserApi userApi = Get.find<UserApi>();
  final DatabaseService databaseService = Get.find<DatabaseService>();

  //post User from details
  Future<Map<String, dynamic>?> postUserDetails({
    required String token,
    required String fullname,
    required String address,
    required String phoneNumber,
    required String email,
    required String city,
    required String state,
    required String role,
    required String pincode,
    required String dob,
  }) async {
    try {
      // Send the user details to the server via the API
      final response = await userApi.postUserDetails(
          token: token,
          fullname: fullname,
          address: address,
          phoneNumber: phoneNumber,
          email: email,
          city: city,
          role: role,
          state: state,
          pincode: pincode,
          dob: dob);

      // Extract the data from the response
      var responseData =
          response.data['userDetails']['formDetails']["phoneNumber"];
      print(responseData);
      await getUser(responseData);
      //
      // // Save the received user data to the local database
      // await databaseService.putUser(UserModel.fromJson(responseData));
      //  if (response.statusCode == 200 && response.data != null) {
      //   await databaseService.putUser(UserModel.fromJson(response.data['userDetails']['formDetails']));
      //   return response.data;
      // } else {
      //   print("Error fetching user: ${response.statusMessage}");
      //   return null;
      // }
      return null;
    } catch (e) {
      // Handle exceptions and rethrow if necessary
      rethrow;
    }
  }

  Future<bool> postStudentDetails({
    required String token,
    required String selectEducation,
    required String fullname,
    required String address,
    required String phoneNumber,
    required String schoolName,
    required String schoolAddress,
    required String boardOption,
    required String classvalue,
    required String mediumName,
    required String aadharcard,
  }) async {
    try {
      // Send the user details to the server via the API
      final response = await userApi.postStudentDetails(
          token: token,
          selectEducation: selectEducation,
          fullname: fullname,
          address: address,
          phoneNumber: phoneNumber,
          schoolName: schoolName,
          schoolAddress: schoolAddress,
          boardOption: boardOption,
          classvalue: classvalue,
          mediumName: mediumName,
          aadharcard: aadharcard);

      // Extract the data from the response
      var responseData =
          response.data['studentDetails']['studentDetails']["phoneNumber"];

      /// var responseData = response.data['data'];
      print(responseData);
      await getUser(responseData.toString());

      // Save the received user data to the local database
      // await databaseService.putStudent(StudentDetails.fromJson(responseData));

      return true;
    } catch (e) {
      // Handle exceptions and rethrow if necessary
      rethrow;
    }
  }

  //to get user details
  Future<Map<String, dynamic>?> getUser(String phoneNumber) async {
    try {
      final response = await userApi.getUser(phoneNumber: phoneNumber);
      if (response.statusCode == 200 && response.data != null) {
        await databaseService
            .putUser(UserModel.fromJson(response.data['user']));
        return response.data;
      } else {
        print("Error fetching user: ${response.statusMessage}");
        return null;
      }
    } catch (e) {
      print("Exception fetching user: $e");
      return null;
    }
  }

// Service method to get question data
  Future<QuizQuestion?> fetchQuestion() async {
    try {
      final userId = databaseService.user?.id;
      final token = databaseService.accessToken;
      final role = databaseService.user?.role;

      if (userId == null || token == null) {
        print('User ID or token is null');
        return null;
      }

      //for other
      if (role == 'other') {
        final response =
            await userApi.getQuestion(token: token, combineID: userId);
        final data = response.data['randomQuestion'];

        if (data != null && data is Map<String, dynamic>) {
          return QuizQuestion.fromJson(data);
        } else {
          print('No question data available');
        }
      } else {
        //for student
        final response =
            await userApi.getStudentQuestion(token: token, combineID: userId);
        final data = response.data;

        if (data != null && data is Map<String, dynamic>) {
          return QuizQuestion.fromJson(data);
        } else {
          print('No question data available for stdents');
        }
      }

      return null;
    } catch (e) {
      print("Exception fetching question: $e");
      return null;
    }
  }

// Service method to get contest id
  Future<String> createContestId(int amount) async {
    try {
      final userId = databaseService.user?.id;
      final userName = databaseService.user?.fullname;
      final token = databaseService.accessToken;

      if (userId == null || token == null || userName == null) {
        print('User ID, token, or username is null');
        return ''; // Return an empty string or handle this case appropriately
      }

      final response = await userApi.createContestId(
          token: token, combineID: userId, name: userName, amount: amount);

      final data = response.data;

      // Navigate through the response structure to extract the actual contestId
      final contestIdMap = data['contestId']; // This is a map containing 'id'
      final contestId = contestIdMap['_id']; // Extract the 'id' from the map

      if (contestId is String) {
        return contestId; // Return the contest ID as a string
      } else {
        print('Invalid contestId type: ${contestId.runtimeType}');
        return ''; // Handle the case where contestId is not a string
      }
    } catch (e) {
      print("Exception fetching contestId: $e");
      rethrow;
    }
  }

// Service method to get contest id
  Future<bool> postAnswer(
      String gkQuestionId, String selectedOption, String contestId) async {
    try {
      final userId = databaseService.user?.id;
      final userName = databaseService.user?.fullname;
      final token = databaseService.accessToken;

      final role = databaseService.user?.role;

      if (userId == null || token == null || userName == null) {
        print('User ID or token is null');
        return true;
      }

      //await databaseService.putContestId(data);
      if (role == 'other') {
        await userApi.postAnswer(
            token: token,
            contestId: contestId,
            combineID: userId,
            gkQuestionId: gkQuestionId,
            selectedOption: selectedOption,
            name: userName);
      } else {
        await userApi.postStudentAnswer(
            token: token,
            contestId: contestId,
            combineID: userId,
            gkQuestionId: gkQuestionId,
            selectedOption: selectedOption,
            name: userName);
      }
      print(databaseService.isContestId);

      return true;
    } catch (e) {
      print("Exception fetching question: $e");
      rethrow;
    }
  }

  Future<String> getScore(String contestId) async {
    try {
      final userId = databaseService.user?.id;
      final token = databaseService.accessToken;

      if (userId == null || token == null) {
        print('Some value is null');
        throw Exception({
          'success': false,
          'score': null
        }); // Returning failure with no score
      }

      // Make the API call to fetch the score
      final response = await userApi.getScore(
        token: token,
        contestId: contestId,
        combineId: userId,
      );

      // Access the score from the response and convert it to a string
      final int score = response.data['score'];
      final String scoreString = score.toString();

      // Store the score as a string in the database
      databaseService.putScore(scoreString);

      print(databaseService.isContestId);

      // Return both success and the score
      if (response.data != null && response.data['score'] != null) {
        return response.data['score']
            .toString(); // Returning the balance as a String
      } else {
        throw Exception('Failed to fetch balance');
      }
    } catch (e) {
      print("Exception fetching score: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getLeaderBoard() async {
    try {
      final userId = databaseService.user?.id;
      final token = databaseService.accessToken;

      if (userId == null || token == null) {
        print('User ID or token is null');
        throw Exception('User ID or token is null');
      }

      var response = await userApi.getLeaderBoard(
        token: token,
        combineID: userId,
      );

      // Ensure response.data is of type Map<String, dynamic>
      if (response.data is Map<String, dynamic>) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (e) {
      print("Exception fetching leaderboard: $e");
      rethrow;
    }
  }

  Future<String> getWalletBalance() async {
    try {
      final userId = databaseService.user?.id;

      if (userId == null) {
        print('User ID is null');
        throw Exception('User ID not found');
      }

      var response = await userApi.fetchWalletBalance(
        combineId: userId,
      );

      // Check the response format and handle balance
      if (response.data != null && response.data['balance'] != null) {
        return response.data['balance']
            .toString(); // Returning the balance as a String
      } else {
        throw Exception('Failed to fetch balance');
      }
    } catch (e) {
      print("Exception fetching Balance: $e");
      rethrow; // Rethrow to let calling code handle it as well
    }
  }

  Future<Map<String, dynamic>> getContest() async {
    try {
      final token = databaseService.accessToken;

      if (token == null) {
        print('token is null');
        throw Exception('token is null');
      }

      var response = await userApi.getContest(
        token: token,
      );

      // Ensure response.data is of type Map<String, dynamic>
      if (response.data is Map<String, dynamic>) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception('Unexpected response format');
      }
    } catch (e) {
      print("Exception fetching leaderboard: $e");
      rethrow;
    }
  }

  Future<bool> joingame(String contestId) async {
    try {
      final userId = databaseService.user?.id;
      final userName = databaseService.user?.fullname;
      final token = databaseService.accessToken;

      if (userId == null || token == null || userName == null) {
        print('User ID or token is null');
        return true;
      }

      print(" user id $userId");

      await userApi.joinGame(
        token: token,
        combineID: userId,
        name: userName,
        contestId: contestId,
      );

      return true;
    } catch (e) {
      print("Exception fetching question: $e");
      rethrow;
    }
  }

  Future<ContestResponse> getContestDetail(String contestId) async {
    try {
      final token = databaseService.accessToken;

      if (token == null) {
        print('Token is null');
        throw Exception(
            'Token is missing'); // Throw a specific exception for token issues
      }

      // Make the API call to fetch the contest details
      final response = await userApi.getContestDetails(
        token: token,
        contestId: contestId,
      );

      // Assuming 'response' contains a valid status and a body
      if (response.statusCode == 200) {
        // Parse the response data into ContestResponse
        final data = response.data; // Assuming response has a 'data' field
        final contestResponse = ContestResponse.fromJson(data);
        print('Contest Details retrieved successfully');
        return contestResponse;
      } else {
        // Handle other status codes or failure scenarios
        throw Exception(
            'Failed to retrieve contest details, Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception fetching Details: $e");
      rethrow; // Rethrow the exception for further handling
    }
  }

  Future<bool> CheckWinnder(
      {
      required String contestId,
      required String combineID1,
      required String combineID2,
      required String amount}) async {
    try {

      final token = databaseService.accessToken;

      if (token == null) {
        print('Token is null');
        throw Exception(
            'Token is missing'); // Throw a specific exception for token issues
      }

      // Send the user details to the server via the API
      final response = await userApi.compare(
          contestId: contestId,
          combineID1: combineID1,
          combineID2: combineID2,
          amount: amount, token: token);

      // Extract the data from the response
      var responseData =
          response.data;

      /// var responseData = response.data['data'];
      print(responseData);
      await getUser(responseData.toString());

      // Save the received user data to the local database
      // await databaseService.putStudent(StudentDetails.fromJson(responseData));

      return true;
    } catch (e) {
      // Handle exceptions and rethrow if necessary
      rethrow;
    }
  }
}
