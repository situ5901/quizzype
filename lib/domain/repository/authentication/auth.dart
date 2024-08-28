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


  Future<bool> verifyOtp(
      {required String phone,
        required String otp,
       }) async {
    try {
     // DeviceInfoModel deviceInfo = await deviceInfoService.getDeviceInfo();
      final response = await authApi.verifyOtp(phone: phone, otp: otp, );
      var user = response.data['data'];
      var token = response.data['token'];
      print("data: $user");

      if (token != null) {
        await databaseService.putAccessToken(token);
        await databaseService.putUser(UserModel.fromJson(user['user']));
        await databaseService.putIsLogin(true);
      }
      return true;
    } catch (e) {
      rethrow;
    }
  }

}
