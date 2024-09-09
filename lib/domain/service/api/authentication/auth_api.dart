part of 'package:quizzype001/domain/service/api/api_import.dart';

class AuthApi {
  final Dio dio;
  AuthApi(this.dio);
  final basePath = '';

  /// Otp Less Authentication
  Future<Response<dynamic>> loginUser({
    required String phone,
  }) async {
    try {
      return await dio.post('$basePath/send-otp', data: {'phoneNumber': phone});
    } catch (e) {
      rethrow;
    }
  }

  /// Otp Verification
  Future<Response<dynamic>> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      return await dio.post(
        '$basePath/verify-otp',
        data: {'phoneNumber': phone, 'otp': otp},
      );
    } catch (e) {
      rethrow;
    }
  }
}
