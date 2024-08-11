import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzype001/Common/BoldText.dart';
import 'package:quizzype001/Common/Colors.dart';
import 'package:quizzype001/Common/PlainText.dart';
import 'package:quizzype001/UI/Otp.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  
  TextEditingController numberCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                    controller: numberCont,
                    decoration: InputDecoration(
                      hintText: "+91 45678987654",
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
                        Get.to(()=> Otp());
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
  }
}
