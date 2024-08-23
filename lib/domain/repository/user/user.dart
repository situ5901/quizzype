part of 'package:quizzype001/domain/repository/repository_imports.dart';

class UserRepository {
  final UserApi userApi = Get.find<UserApi>();
  final DatabaseService databaseService = Get.find<DatabaseService>();

  Future<bool> postUserDetails(UserDetails user,String token) async {
    try {
      // Send the user details to the server via the API
      final response = await userApi.postUserDetails(user,token);

      // Extract the data from the response
      var responseData = response.data['data'];

      // Save the received user data to the local database
      await databaseService.putUser(UserDetails.fromJson(responseData));

      return true;
    } catch (e) {
      // Handle exceptions and rethrow if necessary
      rethrow;
    }
  }


  Future<bool> postStudentDetails(StudentDetails student,String token) async {
    try {
      // Send the user details to the server via the API
      final response = await userApi.postStudentDetails(student,token);

      // Extract the data from the response
      var responseData = response.data['data'];

      // Save the received user data to the local database
      await databaseService.putStudent(StudentDetails.fromJson(responseData));

      return true;
    } catch (e) {
      // Handle exceptions and rethrow if necessary
      rethrow;
    }
  }
}
