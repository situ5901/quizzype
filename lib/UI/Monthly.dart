import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Monthly extends StatelessWidget {
  const Monthly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Monthly Contest",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white), // White arrow
            onPressed: () {
              Navigator.pop(context); // Go back to the previous page
            },
          ),
        ),
        body: Center(
          child:Lottie.asset('Assets/Images/Animation.json',
            height: 300, // set the height
            width: 300,  // set the width
            fit: BoxFit.fill, ),
        ),
      ),
    );
  }
}
