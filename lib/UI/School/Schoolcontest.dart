import 'package:flutter/material.dart';

void main() {
  runApp(SchoolContest());
}

class SchoolContest extends StatelessWidget {
  const SchoolContest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "School Contest",
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "School Contest",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              // Add functionality to navigate back
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
          child: Text("Welcome to the School Contest!"),
        ),
      ),
    );
  }
}
