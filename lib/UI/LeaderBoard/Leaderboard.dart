import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/service/app/app_service_imports.dart';
import 'controller.dart';

class Leaderboard extends StatefulWidget {
  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leaderboard',
      debugShowCheckedModeBanner: false,
      home: GetBuilder<LeaderboardController>(
        init: LeaderboardController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text('Leaderboard', style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.blue,
            ),
            body: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  // Final result announcement banner
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    color: Colors.red,
                    child: Text(
                      "FINAL RESULT OUT AT",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // Show the current user's rank if available
                  if (controller.currentUserRank.value != -1)
                    Container(
                      color: Colors.greenAccent,
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "Your Rank: ${controller.currentUserRank.value}",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  else
                    Container(
                      color: Colors.orangeAccent,
                      padding: EdgeInsets.all(16),
                      child: Text(
                        "You are not ranked yet.",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),

                  // Leaderboard table
                  Expanded(
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Rank')),
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Score')),
                        DataColumn(label: Text('Time')),
                      ],
                      rows: List.generate(
                        controller.leaderboardData.length,
                            (index) {
                          final user = controller.leaderboardData[index];
                          bool isCurrentUser = user.combineId.trim() == Get.find<DatabaseService>().user?.id?.trim();

                          return DataRow(
                            // Highlight the current user's row with a different color
                            color: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (isCurrentUser) {
                                  return Colors.yellow.withOpacity(0.3); // Highlight current user row
                                }
                                return Colors.white; // Default row color for others
                              },
                            ),
                            cells: [
                              DataCell(
                                Text(
                                  '${index + 1}', // Rank
                                  style: TextStyle(
                                    fontWeight: isCurrentUser ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(
                                  "✨${user.combineUser}", // User Name
                                  style: TextStyle(
                                    fontWeight: isCurrentUser ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(
                                  user.score.toString(), // Score
                                  style: TextStyle(
                                    fontWeight: isCurrentUser ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(
                                  "11:30", // Placeholder for time, modify this with the actual time if available
                                  style: TextStyle(
                                    fontWeight: isCurrentUser ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }),
          );
        },
      ),
    );
  }
}
