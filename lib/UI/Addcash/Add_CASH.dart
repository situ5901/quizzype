import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzype001/Common/TapButton.dart';
import 'package:quizzype001/UI/GK%20Quiz/GK_QUIZ.dart';

import '../../Common/BoldText.dart';
import '../../Common/Colors.dart';

class ADD_CASh extends StatefulWidget {
  const ADD_CASh({super.key});

  @override
  State<ADD_CASh> createState() => _ADD_CAShState();
}

class _ADD_CAShState extends State<ADD_CASh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        centerTitle: true,
        title: BoldText(name: "ADD CASH", fontsize: 22, color: Colors.white),
        leading: Icon(Icons.menu, color: Colors.white),
        actions: [
          Container(
            height: 20,
            width: 50,
            color: Colors.white,
            child: BoldText(name:" 100",fontsize: 18,color: Colors.yellow,),
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Image.asset('Assets/Images/Money.png',),
          )
        ],
      ),
      body: SingleChildScrollView(
       child: Column(
          children: [
            Container(
              height: 80,
              color: appColor,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      color: Colors.yellow,
                      child: Icon(Icons.menu),
                    ), SizedBox(
                      width: 12,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:Border.all(
                              width: 2,color: Colors.yellow
                          )
                      ),
                      child: BoldText(name:" ALL ",color:Colors.white,fontsize: 18,),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:Border.all(
                              width: 2,color: Colors.yellow
                          )
                      ),
                      child: BoldText(name:" 4 PLAYERS - 1 WINNER ",color: Colors.white,fontsize: 18,),
                    ), SizedBox(
                      width: 12,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border:Border.all(
                              width: 2,color: Colors.yellow
                          )
                      ),
                      child: BoldText(name:" 4 PLAYERS - 1 WINNER ",color: Colors.white,fontsize: 18,),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefix: Icon(Icons.currency_rupee,color: Colors.black,),
              hintText: 'ENTER AMOUNT',
              hintStyle: TextStyle(color: Colors.grey,fontSize: 25),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12)

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.currency_rupee,color: Colors.black,),
                      BoldText(name: "100", fontsize: 22,color: Colors.yellow,),
                      Icon(Icons.add_outlined,color: Colors.white,)
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12)

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.currency_rupee,color: Colors.black,),
                      BoldText(name: "200", fontsize: 22,color: Colors.yellow,),
                      Icon(Icons.add_outlined,color: Colors.white,)
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12)

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.currency_rupee,color: Colors.black,),
                      BoldText(name: "300", fontsize: 22,color: Colors.yellow,),
                      Icon(Icons.add_outlined,color: Colors.white,)
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(onTap: (){
              showCustomDialog(context);
            },
              child: Container(
                height: 50,width: 150,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12)

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BoldText(name: "PROCEED", fontsize: 22,color: Colors.yellow,),
                    Icon(Icons.arrow_forward,color: Colors.white,)
                  ],
                ),
              ),
            )
          ],
        )
      )
    );
  }
}
class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: 300.0,
        width: 350.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Image.asset('Assets/Images/done.png',height: 150,width: 120,),
            BoldText(name: "SUCCESSFULLY ADDED CASH IN WALLET", color:Colors.blue,fontsize: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundedButton(buttonColor: appColor,
                  title: "JOIN NOW", onTap: (){
Get.to(()=>GK_QUIZ());
              }),
            )
        ]
        ),
      ),
    );
  }
}

void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialog();
    },
  );
  // Close the dialog after 5 seconds
  Future.delayed(Duration(seconds: 10), () {
    Navigator.of(context).pop();
  });
}
