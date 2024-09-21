import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/repository/repository_imports.dart';

import '../../../domain/service/app/app_service_imports.dart';
import '../../../routes/approutes.dart';
import '../../widgets/Toast/toast.dart';

class OtpController extends GetxController {
  final authRepository = AuthRepository();
  var remainTime = "60".obs;
  int _startCounter = 60;
  Timer? periodicTimer;
  bool isRetry = false;
  late String phone;
  TextEditingController otpController = TextEditingController();
  String? token; // To store the token
  final DatabaseService databaseService = Get.find<DatabaseService>();

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    phone = arguments['phone'];
    startTimer();
  }

  void startTimer() async {
    const Duration timerInterval = Duration(seconds: 1);
    periodicTimer = Timer.periodic(timerInterval, (timer) {
      if (_startCounter > 0) {
        --_startCounter;
        remainTime.value = _startCounter.toString();
      } else {
        _startCounter = 60;
        remainTime.value = '60';
        periodicTimer?.cancel();
        isRetry = true;
        update();
      }
    });
  }

  void resendOtp() async {
    isRetry = false;
    otpController.clear();
    update();
    await otpLessLogin();
    startTimer();
  }

  Future<void> otpLessLogin() async {
    try {
      await authRepository.otpLessLogin(phone: phone);
    } catch (error) {
      // Handle error
    }
  }

  Future<void> verifyOtp() async {
    try {
      if (otpController.text.length < 4) {
        showToast(message: 'Enter valid otp');
        return;
      }

       await authRepository.verifyOtp(
        phone: phone,
        otp: otpController.text,
      );

      showToast(message: 'Otp Verified');


     // token = response.data['token']; // Store the token
     // await databaseService.putAccessToken(token!); // Save the token securely // Call the method with token
      // token = databaseService.accessToken; // Retrieve the token using the getter method
      // print("Retrieved token: $token");
      Get.offAllNamed(AppRoutes.homeScreen,arguments: {
        phone
      });
       // Print the token to the console

    } catch (error) {
      showToast(message: error.toString());
    }
  }
}
