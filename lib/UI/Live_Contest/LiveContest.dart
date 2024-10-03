import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quizzype001/Common/BoldText.dart';
import 'package:quizzype001/Common/Colors.dart';
import 'package:quizzype001/Common/PlainText.dart';
import 'package:quizzype001/UI/Gk_contest/GK_Contest.dart';
import 'package:quizzype001/UI/Live_Contest/controller.dart';
import 'package:quizzype001/UI/SideBar.dart';

import '../../model/leaderboard/leaderBoard.dart';
import '../Addcash/Add_CASH.dart';
import '../Collage_Student/Collage_Student.dart';
import '../1-12Class.dart';
import '../Competitive.dart';

class LiveContest extends StatefulWidget {
  const LiveContest({super.key});

  @override
  State<LiveContest> createState() => _LiveContestState();
}

class _LiveContestState extends State<LiveContest> {
  List<String> imagePaths = [
    "Assets/Images/GK_Live.jpg",
    "Assets/Images/1-12.jpg",
    "Assets/Images/coll.jpg",
    "Assets/Images/Com.jpg",
  ];



  final ScrollController _scrollController = ScrollController();
  final LiveController controller = Get.put(LiveController());
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    controller.fetchLeaderboard();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  // Method to start auto-scrolling
  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_scrollController.hasClients) {
        double maxScrollExtent = _scrollController.position.maxScrollExtent;
        double currentScroll = _scrollController.position.pixels;

        if (currentScroll >= maxScrollExtent) {
          _scrollController.jumpTo(0); // Jump back to the start
        } else {
          _scrollController.animateTo(
            currentScroll + 300.0, // Scroll by 300 pixels
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LiveController(),
        builder: (controller){

          return Scaffold(
            drawer: SideBar(),
            appBar: AppBar(
              backgroundColor: Colors.blue,  // Set AppBar background color to white
              title: BoldText(
                name: "LIVE CONTEST",
                fontsize: 22,
                color: Colors.white,  // Ensure the text color remains white
              ),
              centerTitle: true,
              titleTextStyle: TextStyle(
                color: Colors.white,  // Set AppBar title text color to white
                fontSize: 22,
              ),
              actions: [
                Container(
                  height: 20,
                  width: 50,
                  color: Colors.white,
                  child: Text(
                    "₹${controller.balance}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,  // Text color for the balance
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => ADD_CASh());
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Image.asset('Assets/Images/Money.png'),
                  ),
                ),
              ],
              iconTheme: IconThemeData(
                color: Colors.white,  // Ensures icons, like back button, stay white
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                  children: [
                    Container(
                        color: appColor,
                        height: 200,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 35,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border:Border.all(
                                        width: 2,
                                        color: Colors.yellow
                                    )
                                ),
                                child: Center(
                                    child: BoldText(name:"WINNER'S",fontsize: 18,color: Colors.yellow,)
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                          Obx(() {
                            if (controller.isLoading.value) {
                              return Center(child: CircularProgressIndicator());
                            }

                            // Top 3 users
                            List<TopUser> topUsers = controller.leaderboardData.take(3).toList();

                            if (topUsers.isEmpty) {
                              return Center(child: Text('No leaderboard data available.'));
                            }

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              controller: _scrollController,
                              child: Row(
                                children: topUsers.map((user) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 10),

                                    child: Column(
                                      children: [
                                        // Container showing 1st, 2nd, 3rd place
                                        Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              height: 40,
                                              width: 290,
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.horizontal(
                                                  right: Radius.circular(8),
                                                  left: Radius.circular(8),
                                                ),
                                                border: Border.all(width: 2, color: Colors.white),
                                              ),
                                              child: Row(
                                                children: [
                                                  BoldText(
                                                    name: "${topUsers.indexOf(user) + 1}'st   ",
                                                    fontsize: 12,
                                                    color: Colors.white,
                                                  ),
                                                  BoldText(
                                                    name: 'WINNER  ',
                                                    color: Colors.white,
                                                    fontsize: 12,
                                                  ),
                                                  Image.asset('Assets/Images/WIN_YELO.png'),
                                                  Expanded(child: SizedBox()),
                                                  Image.asset('Assets/Images/kanak.png'),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 6), // Gap between the two containers
                                            Container(
                                              height: 70,
                                              width: 290,
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                border: Border.all(width: 2, color: Colors.white),
                                                borderRadius: BorderRadius.horizontal(
                                                  right: Radius.circular(8),
                                                  left: Radius.circular(8),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 22,
                                                    backgroundColor: Colors.black,
                                                    child: Image.asset(
                                                      'Assets/Images/Photo.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  SizedBox(width: 6),
                                                  BoldText(
                                                    name: user.combineUser,
                                                    fontsize: 18,
                                                    color: Colors.white,
                                                  ),
                                                  Expanded(child: SizedBox()),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Image.asset(
                                                        height: 18,
                                                        width: 18,
                                                        'Assets/Images/king.png',
                                                      ),
                                                      BoldText(
                                                        name: "${user.score}",
                                                        color: Colors.yellow,
                                                        fontsize: 18,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            );

                          }),

                            ],
                          ),
                        )
                    ),
                    SizedBox(
                        height:12
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,width: 200,
                            decoration: BoxDecoration(
                              border:Border.all(
                                  width: 2,
                                  color: Colors.greenAccent
                              ),
                            ),
                            child: Center(child:BoldText(name:"CONTEST FOR YOU",color: Colors.greenAccent,fontsize:21)),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: 4,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // Handle navigation based on the clicked item
                                  switch (index) {
                                    case 0:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => GK_Contest()),
                                      );
                                      break;
                                    case 1:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Class()),
                                      );
                                      break;
                                    case 2:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Collage_Student()),
                                      );
                                      break;
                                    case 3:
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Competitive()),
                                      );
                                      break;
                                    default:
                                    // Handle default case or any additional items
                                      break;
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image: AssetImage(imagePaths[index]), // Accessing image path based on index
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 200,
                            width: double.infinity,
                            color: Colors.grey.withOpacity(0.5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("Assets/Images/tick.png"),
                                BoldText(name: 'instant withdrawals', fontsize: 22),
                                PlainText(name: '100% secure payments', fontsize: 25,color: Colors.blueGrey,)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ]
              ),
            ),
          );

    });
  }
}
