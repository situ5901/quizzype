import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzype001/UI/Gk_contest/controller.dart';
import '../../Common/BoldText.dart';
import '../../Common/Colors.dart';
import '../../Common/PlainText.dart';
import '../../routes/approutes.dart';

class GK_Contest extends StatefulWidget {
  const GK_Contest({super.key});

  @override
  State<GK_Contest> createState() => _GK_ContestState();
}

class _GK_ContestState extends State<GK_Contest> {
  @override
  Widget build(BuildContext context) {
    return GetX<GkContestController>(
      init: GkContestController(),
      builder: (controller) {
        if (controller.contests.isEmpty) {
          return Center(child: CircularProgressIndicator()); // Show loading indicator
        }

        // Filter contests that are online (isFull == false)
        var onlineContests = controller.contests.where((contest) => !contest.isFull).toList();

        return Scaffold(
          appBar: AppBar(
            backgroundColor: appColor,
            title: BoldText(name: "GK CONTEST", color: Colors.white, fontsize: 25),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              Container(
                height: 20,
                width: 50,
                color: Colors.white,
                child: BoldText(name: "₹${controller.balance}", fontsize: 18, color: Colors.yellow),
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                for (var contest in onlineContests) // Iterate only over online contests
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
                                    'Rs. ${contest.gameAmount}',
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
                                  color: Colors.green, // Always green because these are online contests
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Online", // Always online
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  controller.joinGame(contest.contestId);

                                  print(contest.contestId);
                                  Get.toNamed(AppRoutes.gK_Question, arguments: contest.contestId.toString());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: Text(
                                  'Join',
                                  style: TextStyle(
                                    color: Colors.white,
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
                SizedBox(height: 14),
              ],
            ),
          ),
        );
      },
    );
  }
}
