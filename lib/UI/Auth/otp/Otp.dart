import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzype001/Common/BoldText.dart';
import 'package:quizzype001/Common/Colors.dart';
import 'package:quizzype001/Common/PlainText.dart';
import 'package:quizzype001/Common/TapButton.dart';

import 'controller.dart';  // Import the OtpController

class Otp extends StatelessWidget {
  Otp({super.key});

  final OtpController otpController = Get.put(OtpController());  // Instantiate the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BoldText(
          name: "Verify Your Account",
          fontsize: 20,
          color: Colors.white,
        ),
        backgroundColor: boxColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Container(
              height: 600,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BoldText(
                    name: "WELCOME",
                    fontsize: 28,
                    color: boxColor,
                  ),
                  PlainText(
                    name: "AUTHORIZATION IS REQUIRED TO YOU ",
                    fontsize: 18,
                  ),
                  PlainText(name: 'TO GET IN.', fontsize: 18),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        4,
                            (index) => OTPDigitField(
                          controller: otpController,  // Pass the controller
                          index: index,  // Pass the index
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12,),
                  Obx(() => Text("Time remaining: ${otpController.remainTime.value}s")),  // Display remaining time
                  SizedBox(height: 12,),
                  RoundedButton(
                    buttonColor: boxColor,
                    title: "SUBMIT",
                    fontsize: 28,
                    onTap: () {
                      otpController.verifyOtp();  // Call verifyOtp from the controller
                    },
                  ),
                  SizedBox(height: 12,),
                  if (otpController.isRetry)  // Show resend button if allowed
                    RoundedButton(
                      buttonColor: Colors.grey,
                      title: "RESEND OTP",
                      fontsize: 28,
                      onTap: () {
                        otpController.resendOtp();  // Call resendOtp from the controller
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OTPDigitField extends StatelessWidget {
  final OtpController controller;
  final int index;

  OTPDigitField({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(
          color: Colors.black,
          fontSize: 28,
        ),
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            controller.otpController.text =
                controller.otpController.text.padRight(4, ' ');

            // Convert the current OTP string to a list of characters
            List<String> otpList = controller.otpController.text.split('');
            otpList[index] = value;
            controller.otpController.text = otpList.join('');

            // Move focus to the next field automatically
            if (index < 3) {
              FocusScope.of(context).nextFocus();
            }
          }
        },
        controller: TextEditingController(
          text: controller.otpController.text.length > index
              ? controller.otpController.text[index]
              : '',
        ),
      ),
    );
  }
}


