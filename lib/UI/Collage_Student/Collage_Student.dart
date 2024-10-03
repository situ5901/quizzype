import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Collage_Student extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Collage_Student',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue, // Set the app bar color to blue
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.white,),
            onPressed: () {
              Navigator.of(context).pop(); // Navigate back when the button is pressed
            },
          ),
        ),
        body: Center(
          child: SizedBox(
            child: Lottie.asset('Assets/Images/search.json'),
          ),
        ),
      ),
    );
  }
}
