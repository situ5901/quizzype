part of 'package:quizzype001/domain/service/api/api_import.dart';

class UserApi {
  final Dio dio;
  UserApi(this.dio);
  final String basePath = ''; // Add your base path here if needed

  // Replace with your actual token


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
          "fullname" : fullname,
          "address":address,
          "email":email,
          "city":city,
          "state":state,
          "pincode":pincode,
          "phoneNumber":phoneNumber,
          "dob":dob

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
        throw Exception('Failed to post user details: ${e.response?.statusCode} ${e.message}');
      } else {
        throw Exception('Unexpected error: $e');
      }
    }
  }

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
    print("selectedBoard: $selectEducation");
    print("selectedMedium: ${mediumName}");
    print("selectedboardOption: ${boardOption}");
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
}