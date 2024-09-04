part of 'package:quizzype001/domain/service/api/api_import.dart';

class UserApi {
  final Dio dio;

  UserApi(this.dio);

  final String basePath = ''; // Add your base path here if needed

  //to get user
  Future<Response> getUser({required String phoneNumber}) async {
    try {
      return await dio.get('$basePath/getdetails?phoneNumber=$phoneNumber');
    } catch (e) {
      rethrow;
    }
  }

  //post user details
  Future<Response> postUserDetails({
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
    ;
    final String endpoint = '/other/add';

    try {
      final response = await dio.post(
        '$basePath$endpoint',
        data: {
          "fullname": fullname,
          "address": address,
          "email": email,
          "city": city,
          "state": state,
          "pincode": pincode,
          "phoneNumber": phoneNumber,
          "dob": dob
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      return response;
    } catch (e) {
      if (e is DioError) {
        throw Exception(
            'Failed to post user details: ${e.response?.statusCode} ${e
                .message}');
      } else {
        throw Exception('Unexpected error: $e');
      }
    }
  }

  //post student details
  Future<Response> postStudentDetails({
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
    print("fullname: ${fullname}");
    print("address: ${address}");
    print("phoneNumber: ${phoneNumber}");
    print("schoolName: ${schoolName}");
    print("schoolAddress: ${schoolAddress}");
    print("aadharcard: ${aadharcard}");
    print("classvalue: ${classvalue}");
    print("selectEducation: $selectEducation");
    print("mediumName: ${mediumName}");
    print("boardOption: ${boardOption}");
    final String endpoint = '/student/add';

    try {
      final response = await dio.post(
        '$basePath$endpoint',
        data: {
          "selectEducation": selectEducation,
          "fullname": fullname,
          "address": address,
          "phoneNumber": phoneNumber,
          "schoolName": schoolName,
          "schoolAddress": schoolAddress,
          "boardOption": boardOption,
          "classvalue": classvalue,
          "mediumName": mediumName,
          "aadharcard": aadharcard
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      return response;
    } catch (e) {
      if (e is DioError) {
        print('Dio Error: ${e.response?.statusCode} ${e.response?.data}');
      } else {
        print('Error: $e');
      }
      rethrow;
    }
  }

// API method to create contest
  Future<Response> createContestId(
      {required String token, required String combineID, required String name}) async {
    try {
      final response = await dio.post(
        '$basePath/create-contest',
        data: {
          "combineId": combineID,
          "fullname": name,
          "gameAmount": "0"
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response;
    } catch (e) {
      print("Error fetching ContestId: $e");
      rethrow;
    }
  }

  // API method to fetch question
  Future<Response> getQuestion(
      {required String token, required String combineID}) async {
    try {
      final response = await dio.post(
        '$basePath/other/question',
        data: {
          "combineId": combineID,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response;
    } catch (e) {
      print("Error fetching question: $e");
      rethrow;
    }
  }

  Future<Response> postAnswer({
    required String token,
    required String contestId,
    required String combineID,
    required String gkQuestionId,
    required String selectedOption,
    required String name}) async {
    try {
      final response = await dio.post(
        '$basePath/other/answer',
        data: {
          "contestId": contestId,
          "combineId": combineID,
          "gkquestionId": gkQuestionId,
          "selectedOption": selectedOption,
          "combineuser": name
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response;
    } catch (e) {
      print("Error fetching ContestId: $e");
      rethrow;
    }
  }

  Future<Response> joinGame({
    required String token,
    required String contestId,
    required String combineID,
    required String name}) async {
    try {
      final response = await dio.post(
        '$basePath/join-game',
        data: {
          "contestId": contestId,
          "newcombineId": combineID,
          "combineuser": name,
          "gameAmount": 100
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response;
    } catch (e) {
      print("Error fetching to join game: $e");
      rethrow;
    }
  }


  Future<Response> compare({
    required String token,
    required String contestId,
    required String combineID1,
    required String combineID2,
    required String name}) async {
    try {
      final response = await dio.post(
        '$basePath/game/compare',
        data: {
          "contestId": contestId,
          "combineId1": combineID1,
          "combineId2": combineID2,
          "winningAmount": "200"
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response;
    } catch (e) {
      print("Error fetching : $e");
      rethrow;
    }
  }


  Future<Response> getResult({
    required String token,
    required String contestId,
    required String combineID1,
    required String combineID2,
  }) async {
    try {
      final response = await dio.post(
        '$basePath/game/result',
        data: {
          "contestId": contestId,
          "combineId1": combineID1,
          "combineId2": combineID2
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response;
    } catch (e) {
      print("Error fetching get Result: $e");
      rethrow;
    }
  }

  Future<Response> getLeaderBoard({
    required String token,
    required String combineID,
  }) async {
    try {
      final response = await dio.get(
        '$basePath/game/result',
        data: {
          "combineId": combineID
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response;
    } catch (e) {
      print("Error fetching to get LeaderBoard: $e");
      rethrow;
    }
  }


  Future<Response> getScore(
      {required String token, required String combineId, required String contestId }) async {
    try {
      final response = await dio.get(
        '$basePath/get/score?combineId=$combineId&contestId=$contestId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response;
    } catch (e) {
      print("Error fetching to score: $e");
      rethrow;
    }
  }
}