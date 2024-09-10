import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

void main() {
  runApp(Leaderboard());
}

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
      home: GetBuilder(
        init: LeaderboardController(),
        builder: (controller){
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white), // arrow color white
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text('Leaderboard', style: TextStyle(color: Colors.white)), // title color white
              backgroundColor: Colors.blue, // title background color blue
            ),
            body: Obx((){
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  Container(
                    width: double.infinity, // full width
                    padding: EdgeInsets.all(16), // add some padding
                    color: Colors.red, // background color red
                    child: Text(
                      "FINAL RESULT OUT AT",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ), // added Text widget
                  ),
                  DataTable(
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
                        return DataRow(
                          cells: [
                            DataCell(Text('${index + 1}')),
                            DataCell(Text("✨${user.combineUser}")),
                            DataCell(Text(user.score.toString())),
                            DataCell(Text("11:30")),
                          ],
                        );
                      },
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