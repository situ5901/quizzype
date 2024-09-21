import 'package:flutter/material.dart';
import 'package:quizzype001/Common/BoldText.dart';
import 'package:quizzype001/Common/Colors.dart';
import 'package:quizzype001/UI/Contest_Details.dart';
import 'package:quizzype001/UI/HomeScreen/Home.dart';
import '../Common/PlainText.dart'; // Make sure to import your HomePage class

class MegaContest extends StatefulWidget {
  const MegaContest({super.key});

  @override
  State<MegaContest> createState() => _MegaContestState();
}

class _MegaContestState extends State<MegaContest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: boxColor,
        centerTitle: true,
        title: BoldText(name: 'MEGA CONTEST', fontsize: 22, color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Back arrow
          onPressed: () {
            Navigator.pop(context); // Navigate back when pressed
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 2.0), // Add margin to the right
            child: Image.asset(
              'Assets/Images/done.png', // Replace with your image asset
              width: 60, // Adjust the width to your liking
              height: 60, // Adjust the height to your liking
            ),
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                Center(
                  child: Text(
                    'FEATURED EVENT IN QUIZZY',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 12),
                Center(
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Image.asset('Assets/Images/Mega.jpeg'),
                  ),
                ),
                SizedBox(height: 12),
                BoldText(name: 'CONTEST DETAILS', fontsize: 28, color: Colors.black),
                SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContestDetails()),
                    );
                  },
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
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.grey,
                              child: Row(
                                children: [
                                  Icon(Icons.watch_later_outlined),
                                  Text("3M:05"),
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
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
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.grey,
                              child: Row(
                                children: [
                                  Icon(Icons.watch_later_outlined),
                                  Text("3M:05"),
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12),
                BoldText(name: 'UPCOMING EVENTS', fontsize: 28),
                SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.card_giftcard, color: Colors.red),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BoldText(
                              name: "MONTHLY CONTEST",
                              fontsize: 22,
                              color: Colors.black,
                            ),
                            PlainText(name: 'joinNow', fontsize: 18, color: Colors.blue)
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
