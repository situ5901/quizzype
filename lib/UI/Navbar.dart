import 'package:flutter/material.dart';
import 'package:quizzype001/UI/HomeScreen/Home.dart';

import 'package:quizzype001/UI/MegaContest.dart';
import 'package:quizzype001/UI/Auth/otp/Otp.dart';
import 'package:quizzype001/UI/Profile/Profile.dart';
import 'package:quizzype001/UI/Live_Contest/LiveContest.dart';
import '../Common/Colors.dart';
import 'Share&Earn.dart';
import 'Shareing.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Dashboard", // Use a string title
      home: Navbar(),
    ),
  );
}

class Navbar extends StatefulWidget {
  @override
  State<Navbar> createState() {
    return NavbarState();
  }
}

class NavbarState extends State<Navbar> {
  var _pageData = [Otp(),Home(),Shareing()];
  int _selectedIteam = 1;
  String _appBarTitle = 'Dashboard'; // Add a variable to store the app bar title

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _pageData[_selectedIteam],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon:Icon(Icons.info),label: "About"),
          BottomNavigationBarItem(icon:Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon:Icon(Icons.cleaning_services),label: "Share")
        ],
        currentIndex: _selectedIteam,
        onTap: (setValue){
          setState(() {
            _selectedIteam=setValue;
            // Update the _appBarTitle based on the selected item
            switch (setValue) {
              case 0:
                _appBarTitle = 'About';
                break;
              case 1:
                _appBarTitle = 'Home';
                break;
              case 2:
                _appBarTitle = 'Services';
                break;
              default:
                _appBarTitle = 'Dashboard';
            }
          });
        },
        selectedItemColor: Colors.blue, // Set the color of the selected item
        unselectedItemColor: Colors.grey, // Set the color of the unselected items
      ),
    );
  }
}