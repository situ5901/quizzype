part of 'package:quizzype001/domain/repository/repository_imports.dart';

class AuthRepository {
  final AuthApi authApi = Get.find<AuthApi>();
  final DatabaseService databaseService = Get.find<DatabaseService>();
  //final DeviceInfoService deviceInfoService = Get.find<DeviceInfoService>();
  Future<bool> otpLessLogin({required String phone}) async {
    try {
   //   DeviceInfoModel deviceInfo = await deviceInfoService.getDeviceInfo();

      // Show loading dialog
     // AppDialog.loading(title: 'Sending OTP...');

      await authApi.loginUser(
           phone: phone,);

      // Dismiss loading dialog
    //  Get.back();

      return true;
    } catch (e) {
      // Dismiss loading dialog
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
      var responseJson = response.data['data'];
      await databaseService.putIsLogin(true);
      return true;
    } catch (e) {
      rethrow;
    }
  }


}
