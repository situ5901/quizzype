import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/repository/repository_imports.dart';
import '../../../App routes/approutes.dart';
import '../../widgets/Toast/toast.dart';

class OtpController extends GetxController {
  final authRepository = AuthRepository();
  var remainTime = "60".obs;
  int _startCounter = 60;
  Timer? periodicTimer;
  bool isRetry = false;
  late String phone;
  TextEditingController otpController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Retrieve the phone number passed from the LoginController
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
      // showToast(message: error.toString());
    }
  }

  Future<void> verifyOtp() async {
    try {
      if (otpController.text.length < 4) {
         showToast(message: 'Enter valid otp');
        return;
      }
      // Show loading dialog
      // AppDialog.loading(title: 'Verifying OTP...');
      await authRepository.verifyOtp(phone: phone, otp: otpController.text);
      showToast(message: 'Otp Verified');
     // Get.back();
      Get.offAllNamed(AppRoutes.homeScreen);
    } catch (error) {
     // Get.back();
      showToast(message: error.toString());
    }
  }

  @override
  void onClose() {
    periodicTimer?.cancel();
    super.onClose();
  }
}
