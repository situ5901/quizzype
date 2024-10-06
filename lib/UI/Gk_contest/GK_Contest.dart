import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzype001/UI/Gk_contest/controller.dart';
import 'package:lottie/lottie.dart'; // Import Lottie package
import '../../Common/BoldText.dart';
import '../../Common/Colors.dart';
import '../../Common/PlainText.dart';
import '../../routes/approutes.dart';
import '../../model/ContestModel/contest_model.dart';

class GK_Contest extends StatefulWidget {
  const GK_Contest({super.key});

  @override
  State<GK_Contest> createState() => _GK_ContestState();
}

class _GK_ContestState extends State<GK_Contest> {

  // Confirmation Dialog on Exit
  Future<void> _showExitConfirmation(BuildContext context) async {
    final exit = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Exit Confirmation'),
          content: Text('You lost the game. If you exit, do you want to continue?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false), // Do not exit
              child: Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true), // Exit
              child: Text('Yes'),
            ),
          ],
        );
      },
    );

    if (exit == true) {
      // Handle the exit logic here
      // For example, pop the current screen or navigate back
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX<GkContestController>(
      init: GkContestController(),
      builder: (controller) {
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
              ),
            ],
          ),
          body: onlineContests.isEmpty
              ? Center(
            child: Text(
              "No contest available",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
              : SingleChildScrollView(
            child: Column(
              children: [
                for (var contest in onlineContests)
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
                            name: 'Join Players ${contest.players.length}',
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
                                  color: Colors.green,
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
                                      "Online",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  String contestId = contest.contestId; // Ensure contest is defined

                                  // Show the dialog
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        elevation: 16,
                                      child:  WillPopScope( // Intercept back button press
                                          onWillPop: () async {
                                            // Show a confirmation dialog when the user tries to exit
                                            bool shouldExit = await showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text("Exit Game"),
                                                content: Text("You will lose the game if you exit. Do you want to proceed?"),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () => Navigator.of(context).pop(false), // Don't exit
                                                    child: Text("No"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () => Navigator.of(context).pop(true), // Exit
                                                    child: Text("Yes"),
                                                  ),
                                                ],
                                              ),
                                            );
                                            return shouldExit; // Return true to exit, false to stay in the game
                                          },
                                          child: Container(
                                            width: double.maxFinite,
                                            height: 250,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                // Display the current user's name at the top
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    '${controller.currentusername}',
                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                // Lottie Animation
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Lottie.asset('Assets/Images/battle.json'),
                                                ),
                                                // Dynamic Player Names and Waiting Message
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    children: [
                                                      // Show dynamic player names with waiting message
                                                      Obx(() {
                                                        // Retrieve and sort the players based on contestId
                                                        List<Player> sortedPlayers = controller.contests
                                                            .firstWhere((contest) => contest.contestId == contestId)
                                                            .players;

                                                        // Sort players to display the current user at the top
                                                        sortedPlayers.sort((a, b) {
                                                          if (a.combineId == controller.currentuser) return -1;
                                                          if (b.combineId == controller.currentuser) return 1;
                                                          return 0;
                                                        });

                                                        return Column(
                                                          children: [
                                                            for (var player in sortedPlayers)
                                                              Text(
                                                                player.fullname,
                                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                              ),
                                                            if (sortedPlayers.length < 2 && controller.showWaitingMessage)
                                                              WaitingMessage(), // This condition checks the waiting message visibility
                                                          ],
                                                        );
                                                      }),

                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );

                                  // Join the game and start checking player status
                                  controller.joinGame(contestId); // Ensure joinGame is functioning properly
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

// New Widget for Animated Waiting Message
class WaitingMessage extends StatefulWidget {
  @override
  _WaitingMessageState createState() => _WaitingMessageState();
}

class _WaitingMessageState extends State<WaitingMessage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true); // Repeat the animation

    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Waiting for player"),
        SizedBox(width: 5),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Text(
              '.' * (1 + (_animation.value * 3).round()),
              style: TextStyle(fontSize: 16),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

