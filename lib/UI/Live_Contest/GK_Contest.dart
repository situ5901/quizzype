import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Common/BoldText.dart';
import '../../Common/Colors.dart';
import '../../Common/PlainText.dart';
import '../Addcash/Add_CASH.dart';

class GK_Contest extends StatefulWidget {
  const GK_Contest({super.key});

  @override
  State<GK_Contest> createState() => _GK_ContestState();
}

class _GK_ContestState extends State<GK_Contest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: appColor,
        title: BoldText(name: "GK CONTEST",color: Colors.white,fontsize: 25,),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [
          Container(
            height: 20,
            width: 50,
            color: Colors.white,
            child: BoldText(name:" 100",fontsize: 18,color: Colors.yellow,),
          ),
          InkWell(onTap: (){
            Get.to(()=> ADD_CASh());
          },
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Image.asset('Assets/Images/Money.png',),
            ),
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
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
                                'Rs. 50',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                ),
                              )
                            ],
                          ),
                          Container(
                            color: Colors.grey,
                            child: Row(
                              children: [
                                Icon(Icons.watch_later_outlined),
                                Text("3M:05")
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              BoldText(name: 'FREE', fontsize: 12),
                              Text(
                                'Rs. FREE',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
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
                                'Rs. 50',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                ),
                              )
                            ],
                          ),
                          Container(
                            color: Colors.grey,
                            child: Row(
                              children: [
                                Icon(Icons.watch_later_outlined),
                                Text("3M:05")
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              BoldText(name: 'FREE', fontsize: 12),
                              Text(
                                'Rs. FREE',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ), Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
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
                                'Rs. 50',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                ),
                              )
                            ],
                          ),
                          Container(
                            color: Colors.grey,
                            child: Row(
                              children: [
                                Icon(Icons.watch_later_outlined),
                                Text("3M:05")
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              BoldText(name: 'FREE', fontsize: 12),
                              Text(
                                'Rs. FREE',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ), Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
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
                                'Rs. 50',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                ),
                              )
                            ],
                          ),
                          Container(
                            color: Colors.grey,
                            child: Row(
                              children: [
                                Icon(Icons.watch_later_outlined),
                                Text("3M:05")
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              BoldText(name: 'FREE', fontsize: 12),
                              Text(
                                'Rs. FREE',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ), Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
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
                                'Rs. 50',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                ),
                              )
                            ],
                          ),
                          Container(
                            color: Colors.grey,
                            child: Row(
                              children: [
                                Icon(Icons.watch_later_outlined),
                                Text("3M:05")
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              BoldText(name: 'FREE', fontsize: 12),
                              Text(
                                'Rs. FREE',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ), Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
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
                                'Rs. 50',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                ),
                              )
                            ],
                          ),
                          Container(
                            color: Colors.grey,
                            child: Row(
                              children: [
                                Icon(Icons.watch_later_outlined),
                                Text("3M:05")
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              BoldText(name: 'FREE', fontsize: 12),
                              Text(
                                'Rs. FREE',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ), Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
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
                                'Rs. 50',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                ),
                              )
                            ],
                          ),
                          Container(
                            color: Colors.grey,
                            child: Row(
                              children: [
                                Icon(Icons.watch_later_outlined),
                                Text("3M:05")
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              BoldText(name: 'FREE', fontsize: 12),
                              Text(
                                'Rs. FREE',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                ),
                              )
                            ],
                          )
                        ],
                      )
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
  }
}
