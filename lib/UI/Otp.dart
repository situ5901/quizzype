import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzype001/Common/BoldText.dart';
import 'package:quizzype001/Common/Colors.dart';
import 'package:quizzype001/Common/PlainText.dart';
import 'package:quizzype001/Common/TapButton.dart';

import 'Password.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  List<String> otpDigits = List.filled(6, '');

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
                      fontsize: 18,),
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
                          value: otpDigits[index],
                          onChanged: (newValue) {
                            setState(() {
                              otpDigits[index] = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12,),
                  RoundedButton(
                      buttonColor: boxColor,
                      title: "SUBMIT",
                      fontsize: 28,
                      onTap: (){
                        Get.to(()=> PasswordUI());
                      })
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
  final String value;
  final ValueChanged<String> onChanged;

  const OTPDigitField({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: value.isNotEmpty ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(
          color: Colors.white,
          fontSize: 28// set text color to white
        ),
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        onChanged: onChanged,
        controller: TextEditingController(text: value),
      ),
    );
  }
}