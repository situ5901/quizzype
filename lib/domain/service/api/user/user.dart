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

  Future<Response> postStudentDetails(StudentDetails student,String token) async {
    final String endpoint = '/student/add';

    try {
      final response = await dio.post(
        '$basePath$endpoint',
        data: student.toJson(),
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