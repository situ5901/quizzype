import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizzype001/UI/GK%20Quiz/scoreController.dart';

import '../LeaderBoard/Leaderboard.dart'; // Import Lottie package

void main() {
  runApp(const Showscore());
}

class Showscore extends StatelessWidget {
  const Showscore({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowScoreController>(
      init: ShowScoreController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Score Display',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0), // Add padding around the body
            child: controller.isLoading // Check loading state
                ? Center( // Show circular progress indicator while loading
              child: CircularProgressIndicator(),
            )
                : Column(
              mainAxisAlignment: MainAxisAlignment.start, // Align content to the top
              crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
              children: [
                const SizedBox(height: 10), // Margin from top
                const Text(
                  "Game Results Here",
                  style: TextStyle(
                    fontSize: 24, // Adjust font size as needed
                    fontWeight: FontWeight.bold, // Make it bold
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 20), // Add space between text and container

                // If less than 2 players, show waiting message
                if (controller.contest.players.length < 2)
                  Text(
                    "Waiting for another player...",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                else // Otherwise, show game result container
                  Container(
                    height: 250,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Score here",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.person, size: 50, color: Colors.white),
                                const SizedBox(height: 8),
                                Text(
                                  controller.winnerName, // Winner's name
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            // Lottie Animation
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Lottie.asset(
                                'Assets/Images/battle.json',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.person, size: 50, color: Colors.white),
                                const SizedBox(height: 8),
                                Text(
                                  controller.loserName, // Loser's name
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 60,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Score(${controller.winnerScore})", // Winner's score
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "Winner",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Score(${controller.loserScore})", // Loser's score
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "Fail",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                // Show the message when the other player loses
                if (controller.contest.players.length == 2 &&
                    controller.loserScore > 0)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${controller.loserName} has lost the game.",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),

                const SizedBox(height: 20), // Space between container and button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Leaderboard()), // Replace 'NewPage' with your target screen widget.
                    );
                  },

                  child: const Text(
                    "Next Round",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12), // Adjust button padding
                    backgroundColor: Colors.blue, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), // Button border radius
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
