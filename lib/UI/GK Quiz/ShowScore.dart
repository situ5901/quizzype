import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:quizzype001/UI/GK%20Quiz/scoreController.dart';

import '../LeaderBoard/Leaderboard.dart';

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
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Game Results Here",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 20),

                // Waiting for another player
                if (controller.contest.players.length < 2)
                  const Text(
                    "Waiting for another player...",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                else
                  Column(
                    children: [
                      // Score Display Container
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
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.person,
                                        size: 50, color: Colors.white),
                                    const SizedBox(height: 8),
                                    Text(
                                      controller.winnerName,
                                      style: const TextStyle(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Lottie.asset(
                                    'Assets/Images/battle.json',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.person,
                                        size: 50, color: Colors.white),
                                    const SizedBox(height: 8),
                                    Text(
                                      controller.loserName,
                                      style: const TextStyle(
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 60,
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Score(${controller.winnerScore})",
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
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Score(${controller.loserScore})",
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

                      // Pie Chart for score visualization
                    ],
                  ),
                // Animated Text for winner announcement
                if (controller.contest.players.length == 2 &&
                    controller.loserScore > 0)
                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 20),
                    child: Center(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          FadeAnimatedText(
                            "${controller.winnerName} has won the Game.",
                            textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                            duration:
                            const Duration(milliseconds: 2000),
                          ),
                        ],
                        repeatForever: true,
                      ),
                    ),
                  ),
                const SizedBox(height: 30),

                // Next Round Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Leaderboard()),
                    );
                  },
                  child: const Text(
                    "Next Round",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PieChart(
                        dataMap: {
                          "Winner (${controller.winnerScore})": controller.winnerScore.toDouble(),
                          "Loser (${controller.loserScore})": controller.loserScore.toDouble(),
                        },
                        colorList: [Colors.green, Colors.red],
                        chartRadius: MediaQuery.of(context).size.width / 2.5, // Adjust size
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValuesInPercentage: true,
                          showChartValues: true,
                          chartValueBackgroundColor: Colors.white,
                        ),
                        legendOptions: const LegendOptions(
                          showLegends: false, // Turn off legends since we are showing custom text
                        ),
                        animationDuration: const Duration(milliseconds: 800),
                        chartType: ChartType.ring,
                      ),
                      const SizedBox(height: 20), // Space between PieChart and text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: const [
                              Text(
                                "Winner",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                  backgroundColor: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              Text(
                                "Loser",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
