import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class junior2 extends StatelessWidget {
  const junior2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Junior Gk",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade900,
        iconTheme: IconThemeData(
          color: Colors.white, // Change this color as needed
        ),
      ),
      // Adding body content
      body: Center(
        child:Lottie.asset('Assets/Images/Animation.json',
          height: 300, // set the height
          width: 300,  // set the width
          fit: BoxFit.fill, ),
      ),
    );
  }
}
