import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzype001/UI/Gk_contest/controller.dart';

import '../../Common/BoldText.dart';
import '../../Common/Colors.dart';
import '../../Common/PlainText.dart';
import '../../routes/approutes.dart';
import '../Addcash/Add_CASH.dart';

class GK_Contest extends StatefulWidget {
  const GK_Contest({super.key});

  @override
  State<GK_Contest> createState() => _GK_ContestState();
}
class _GK_ContestState extends State<GK_Contest> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: GkContestController(),
      builder: (controller){
        return  Scaffold(
          appBar: AppBar(
            backgroundColor: appColor,
            title: BoldText(name: "GK CONTEST", color: Colors.white, fontsize: 25),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [

              Container(
                height: 20,
                width: 50,
                color: Colors.white,
                child: BoldText(name:"₹${controller.balance}", fontsize: 18, color: Colors.yellow),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.addCash);
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Image.asset('Assets/Images/Money.png'),
                ),
              )
            ],
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: appColor,
                        ),
                      ),
                      child: Column(
                        children: [
                          PlainText(
                            name: '2 PLAYERS - WINNER',
                            fontsize: 12,
                            color: Colors.black,
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  BoldText(name: 'PRIZE POOL', fontsize: 12),
                                  Text(
                                    'Rs. 25',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      backgroundColor: Colors.blue.shade900,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  borderRadius: BorderRadius.circular(10), // Set border radius to 10
                                ),
                                padding: EdgeInsets.all(8), // Optional padding for spacing
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.white, // Set icon color to white
                                    ),
                                    SizedBox(width: 5), // Add space between the icon and the text
                                    Text(
                                      "Online",
                                      style: TextStyle(
                                        color: Colors.white, // Set text color to white
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Button with red background and white text
                              ElevatedButton(
                                onPressed: () {
                                  // Action to be performed when the button is pressed
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => ADD_CASh()), // Replace with your LoginPage widget
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red, // Red background
                                ),
                                child: Text(
                                  'Join',
                                  style: TextStyle(
                                    color: Colors.white, // White text
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: appColor,
                        ),
                      ),
                      child: Column(
                        children: [
                          PlainText(
                            name: '2 PLAYERS - WINNER',
                            fontsize: 12,
                            color: Colors.black,
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  BoldText(name: 'PRIZE POOL', fontsize: 12),
                                  Text(
                                    'Rs. 25',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      backgroundColor: Colors.blue.shade900,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  borderRadius: BorderRadius.circular(10), // Set b
                                  // order radius to 10
                                ),
                                padding: EdgeInsets.all(8), // Optional padding for spacing
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.white, // Set icon color to white
                                    ),
                                    SizedBox(width: 5), // Add space between the icon and the text
                                    Text(
                                      "Online",
                                      style: TextStyle(
                                        color: Colors.white, // Set text color to white
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Button with red background and white text
                              ElevatedButton(
                                onPressed: () {
                                  // Action to be performed when the button is pressed
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => ADD_CASh()), // Replace with your LoginPage widget
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red, // Red background
                                ),
                                child: Text(
                                  'Join',
                                  style: TextStyle(
                                    color: Colors.white, // White text
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: appColor,
                        ),
                      ),
                      child: Column(
                        children: [
                          PlainText(
                            name: '2 PLAYERS - WINNER',
                            fontsize: 12,
                            color: Colors.black,
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  BoldText(name: 'PRIZE POOL', fontsize: 12),
                                  Text(
                                    'Rs. 25',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      backgroundColor: Colors.blue.shade900,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  borderRadius: BorderRadius.circular(10), // Set border radius to 10
                                ),
                                padding: EdgeInsets.all(8), // Optional padding for spacing
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.white, // Set icon color to white
                                    ),
                                    SizedBox(width: 5), // Add space between the icon and the text
                                    Text(
                                      "Online",
                                      style: TextStyle(
                                        color: Colors.white, // Set text color to white
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Button with red background and white text
                              ElevatedButton(
                                onPressed: () {
                                  // Action to be performed when the button is pressed
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => ADD_CASh()), // Replace with your LoginPage widget
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red, // Red background
                                ),
                                child: Text(
                                  'Join',
                                  style: TextStyle(
                                    color: Colors.white, // White text
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: appColor,
                        ),
                      ),
                      child: Column(
                        children: [
                          PlainText(
                            name: '2 PLAYERS - WINNER',
                            fontsize: 12,
                            color: Colors.black,
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  BoldText(name: 'PRIZE POOL', fontsize: 12),
                                  Text(
                                    'Rs. 25',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      backgroundColor: Colors.blue.shade900,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  borderRadius: BorderRadius.circular(10), // Set border radius to 10
                                ),
                                padding: EdgeInsets.all(8), // Optional padding for spacing
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.white, // Set icon color to white
                                    ),
                                    SizedBox(width: 5), // Add space between the icon and the text
                                    Text(
                                      "Online",
                                      style: TextStyle(
                                        color: Colors.white, // Set text color to white
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Button with red background and white text
                              ElevatedButton(
                                onPressed: () {
                                  // Action to be performed when the button is pressed
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => ADD_CASh()), // Replace with your LoginPage widget
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red, // Red background
                                ),
                                child: Text(
                                  'Join',
                                  style: TextStyle(
                                    color: Colors.white, // White text
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 14,)

                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
