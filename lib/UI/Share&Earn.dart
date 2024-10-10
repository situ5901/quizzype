import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const Shareing());
}

class Shareing extends StatelessWidget {
  const Shareing({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Shareing Page',
            style: TextStyle(color: Colors.white),
          ), // AppBar title
          backgroundColor: Colors.blue,
        ),
        body: Center(// Center the entire column
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center children vertically
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 250,
                  width: 250, // Set a width for the container
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Lottie.asset(
                    'Assets/Images/share.json',
                    fit: BoxFit.fill, // Ensure the animation fills the container
                  ),
                ),
              ),
              Container(
                child: Text("ESHJSKLSDGER",style: TextStyle(fontSize: 20),),
              ),
              const SizedBox(height: 20), // Space between the container and button
              ElevatedButton(
                onPressed: () {
                  Share.share('com.example.quizzype001');

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invite link shared!'),
                    ),
                  );
                },
                child: const Text('Share'), // Button text
              ),
            ],
          ),
        ),
      ),
    );
  }
}
