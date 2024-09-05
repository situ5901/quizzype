part of 'package:quizzype001/domain/repository/repository_imports.dart';

class UserRepository {
  final UserApi userApi = Get.find<UserApi>();
  final DatabaseService databaseService = Get.find<DatabaseService>();



  //post User from details
  Future<bool> postUserDetails({
    required String token,
    required String fullname,
    required String address,
    required String phoneNumber,
    required String email,
    required String city,
    required String state,
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
          state: state,
          pincode: pincode,
          dob: dob);

      // Extract the data from the response
       var responseData = response.data['formDetails'];

      // Save the received user data to the local database
      await databaseService.putUser(UserModel.fromJson(responseData));

      return true;
    } catch (e) {
      // Handle exceptions and rethrow if necessary
      rethrow;
    }
  }


  Future<bool> postStudentDetails({
    required String token,
    required var selectEducation,
    required var fullname,
    required var address,
    required var phoneNumber,
    required var schoolName,
    required var schoolAddress,
    required var boardOption,
    required var classvalue,
    required var mediumName,
    required var aadharcard,

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
      var responseData = response.data['data'];

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
      final response = await userApi.getUser( phoneNumber: phoneNumber);
      if (response.statusCode == 200 && response.data != null) {
        await databaseService.putUser(UserModel.fromJson(response.data['data']));
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

      if (userId == null || token == null) {
        print('User ID or token is null');
        return null;
      }

      final response = await userApi.getQuestion(token: token, combineID: userId);
      final data = response.data['randomQuestion'];

      if (data != null && data is Map<String, dynamic>) {
        return QuizQuestion.fromJson(data);
      } else {
        print('No question data available');
        return null;
      }
    } catch (e) {
      print("Exception fetching question: $e");
      return null;
    }
  }


// Service method to get contest id
  Future <bool> createContestId() async {
    try {
      final userId = databaseService.user?.id;
      final userName = databaseService.user?.fullname;
      final token = databaseService.accessToken;

      if (userId == null || token == null || userName == null) {
        print('User ID or token is null');
        return true;
      }

      final response = await userApi.createContestId(token: token, combineID: userId, name: userName);
      final data = response.data['contestId'];

      await databaseService.putContestId(data);

      print(databaseService.isContestId);

      return true;

    } catch (e) {
      print("Exception fetching question: $e");
      rethrow;
    }
  }


// Service method to get contest id
  Future <bool> postAnswer(String gkQuestionId,String selectedOption) async {
    try {
      final userId = databaseService.user?.id;
      final userName = databaseService.user?.fullname;
      final token = databaseService.accessToken;
      final contestId = databaseService.isContestId;

      if (userId == null || token == null || userName == null || contestId == null)  {
        print('User ID or token is null');
        return true;
      }



      //await databaseService.putContestId(data);
      await userApi.postAnswer(
          token: token,
          contestId: contestId,
          combineID: userId,
          gkQuestionId: gkQuestionId,
          selectedOption: selectedOption,
          name: userName);
      print(databaseService.isContestId);

      return true;

    } catch (e) {
      print("Exception fetching question: $e");
      rethrow;
    }
  }



  Future<Map<String, dynamic>> getScore() async {
    try {
      final userId = databaseService.user?.id;
      final token = databaseService.accessToken;
      final contestId = databaseService.isContestId;

      if (userId == null || token == null || contestId == null) {
        print('Some value is null');
        return {'success': false, 'score': null}; // Returning failure with no score
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
      return {'success': true, 'score': score};

    } catch (e) {
      print("Exception fetching score: $e");
      rethrow;
    }
  }


}
