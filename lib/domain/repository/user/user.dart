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
     // await databaseService.putUser(UserDetails.fromJson(responseData));

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
}
