import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzype001/Common/BoldText.dart';
import 'package:quizzype001/Common/Colors.dart';
import 'package:quizzype001/Common/PlainText.dart';
import 'package:quizzype001/Common/TapButton.dart';

class Shareing extends StatefulWidget {
  const Shareing({super.key});

  @override
  State<Shareing> createState() => _ShareingState();
}

class _ShareingState extends State<Shareing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BoldText(name: "INVITE FRIENDS",color: boxColor,fontsize: 22,),
        leading: InkWell(
          onTap:(){
            Get.back();
          },
          child: CircleAvatar(
            radius: 20,
            child:Icon(Icons.arrow_back_outlined),
          ),
        ),
      ),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 12),
       child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 16,
              ),
              Container(
                height: 350,
                width: double.infinity,
                child: Image.asset("Assets/Images/gipy.jpg",fit: BoxFit.fill,)
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: BoldText(
                  name:'YOUR INVITE CODE',fontsize: 22,color: boxColor,
                ),
              ),
                SizedBox(
                  height: 16,
                ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border:Border.all(
                      style: BorderStyle.solid

                    )
                  ),
                  height: 60,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BoldText(name: "  AHUVUEHBCK2S              |", fontsize:22,color: Colors.black,),
                     Icon(Icons.copy,color: Colors.black,)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: BoldText(
                  name:'SEND AN INVITE',fontsize: 22,color: boxColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              PlainText(name: "send an invite to your friend and earn \n            bonus each time", fontsize: 16,color:Colors.grey,)
              ,SizedBox(
                height: 16,
              ),
              RoundedButton(buttonColor: Colors.yellow,
                  title: "INVITE NEW FRIEND", textColor:boxColor,fontsize: 22,onTap: (){

              })

            ],
          ),
        )
      ),
    );
  }
}
