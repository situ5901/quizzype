part of 'package:quizzype001/domain/service/api/api_import.dart';

class UserApi {
  final Dio dio;
  UserApi(this.dio);
  final String basePath = ''; // Add your base path here if needed

  // Replace with your actual token


  Future<Response> postUserDetails(UserDetails userDetails,String token) async {
    final String endpoint = '/other/add';

    try {
      final response = await dio.post(
        '$basePath$endpoint',
        data: userDetails.toJson(),
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
    final String endpoint = '/student/add';

    try {
      final response = await dio.post(
        '$basePath$endpoint',
        data: {
          "selectEducation":selectEducation,
          "fullname":fullname,
          "address": address,
          "phoneNumber":phoneNumber,
          "schoolName":schoolName,
          "schoolAddress":schoolAddress,
          "boardOption":"${boardOption}_Board",
          "classvalue":classvalue,
          "mediumName":"${mediumName}_Medium",
          "aadharcard":aadharcard

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

      rethrow;
    }
  }
}