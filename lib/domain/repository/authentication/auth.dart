part of 'package:quizzype001/domain/repository/repository_imports.dart';

class AuthRepository {
  final AuthApi authApi = Get.find<AuthApi>();
  final DatabaseService databaseService = Get.find<DatabaseService>();

  Future<bool> otpLessLogin({required String phone}) async {
    try {
      await authApi.loginUser(phone: phone);
      return true;
    } catch (e) {
      Get.back();
      rethrow;
    }
  }

  Future<dio.Response> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final dio.Response response = await authApi.verifyOtp(phone: phone, otp: otp);
      var responseJson = response.data['data'];
      await databaseService.putIsLogin(true);
      return response; // Return the actual dio.Response object
    } catch (e) {
      rethrow;
    }
  }
}
