import 'package:flutter/material.dart';
import 'package:quizzype001/UI/Gk_contest/GK_Contest.dart';
import 'package:quizzype001/UI/HomeScreen/Home.dart';

class junior extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GK Contest',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade900,
        iconTheme: IconThemeData(color: Colors.white), // Set back arrow color to white
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: _buildContestCard(
              context,
              title: 'JUNIOR GK',
              subtitle1: 'join competition',
              subtitle2: 'Under 18 only',
              imagePath: 'Assets/Images/Photo.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: _buildContestCard(
              context,
              title: 'Senior GK',
              subtitle1: 'join competition',
              subtitle2: '18+ Only',
              imagePath: 'Assets/Images/students.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GK_Contest()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContestCard(BuildContext context, {
    required String title,
    required String subtitle1,
    required String subtitle2,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.2, // Responsive height
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade900, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    subtitle1,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    subtitle2,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset(
                    imagePath,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      backgroundColor: Colors.yellow,
                    ),
                    child: Text(
                      'Join',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
