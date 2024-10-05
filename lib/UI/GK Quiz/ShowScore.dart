import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Import Lottie package

void main() {
  runApp(const Showscore());
}

class Showscore extends StatelessWidget {
  const Showscore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Score Display',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding around the body
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align content to the top
            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
            children: [
              const SizedBox(height: 10), // Margin from top
              // Text above the container
              const Text(
                "Game Results Here",
                style: TextStyle(
                  fontSize: 24, // Adjust font size as needed
                  fontWeight: FontWeight.bold, // Make it bold
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20), // Add space between text and container
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
                            const Text(
                              "Name",
                              style: TextStyle(color: Colors.white),
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
                            const Text(
                              "Name",
                              style: TextStyle(color: Colors.white),
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
                            children: const [
                              Text(
                                "Score",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
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
                            children: const [
                              Text(
                                "Score",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
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
              const SizedBox(height: 20), // Space between container and button
              ElevatedButton(
                onPressed: () {

                  print("Button Pressed!");
                },
                child: const Text("Next Round",
                style: TextStyle(color: Colors.white),
                ),
                style:
                ElevatedButton.styleFrom(
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
      ),
    );
  }
}
