import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzype001/Common/BoldText.dart';
import 'package:quizzype001/Common/Colors.dart';
import 'package:quizzype001/Common/PlainText.dart';
import 'package:quizzype001/UI/Auth/otp/Otp.dart';

import 'login_controller.dart';

class Login_Page extends StatelessWidget {


  TextEditingController numberCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller){
          return Scaffold(
            backgroundColor: appColor,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child:Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0)
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    height: 300,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BoldText(name:"LOGIN",fontsize: 25,color:boxColor),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "ENTER YOUR MOBILE NUMBER",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue[900],
                              fontFamily: 'OpenSans', // or any other font family you prefer
                              fontStyle: FontStyle.italic, // italic font style
                              fontWeight: FontWeight.bold, // bold font weight
                            ),
                          ),SizedBox(height: 12,),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: controller.numberController,
                            decoration: InputDecoration(
                              hintText: "Enter PhoneNumber",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 39,
                            decoration: BoxDecoration(   color: boxColor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: InkWell(
                              onTap: (){
                                controller.otpLessLogin();
                                // Get.to(()=> Otp());
                              },
                              child: Center(child: BoldText(name:"GET OTP",fontsize: 20,color:
                              Colors.white,)),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ) ,
            ),
          );
        });
  }
}