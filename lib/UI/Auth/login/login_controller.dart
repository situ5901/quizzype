import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../../domain/repository/repository_imports.dart';
import '../../../../../domain/service/app/app_service_imports.dart';
import '../../../App routes/approutes.dart';
import '../../widgets/Toast/toast.dart';


class LoginController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    otpLessLogin();
  }

  final repository = AuthRepository();

  TextEditingController numberController = TextEditingController();

  String countryCode = '+91';

  /// Update country code into variable
  void changeCountryCode(String code) {
    countryCode = code;
  }

  /// Get otp
  Future<void> otpLessLogin() async {


    print('Phone Number: ${numberController.text}');
    try {
      if (numberController.text.length != 10) {

        return;
      }
      Get.toNamed(AppRoutes.verify, arguments: {
        'phone': numberController.text,
      });
      await repository.otpLessLogin(phone: numberController.text,);
      showToast(message: 'Enter Otp');
    } catch (error) {
     showToast(message: error.toString());
    }
  }

  /// Check Initial location permission is granted of not

}