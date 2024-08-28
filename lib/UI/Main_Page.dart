import 'package:flutter/material.dart';
import 'package:quizzype001/Common/Colors.dart';
import 'package:quizzype001/UI/Gift_Voucher.dart';
import 'package:quizzype001/UI/HomeScreen/Home.dart';
import 'package:quizzype001/UI/Live_Contest/LiveContest.dart';
import 'package:quizzype001/UI/Profile/Profile.dart';
import 'package:quizzype001/UI/Share&Earn.dart';

class Main_Page extends StatefulWidget {
  const Main_Page({Key? key});

  @override
  State<Main_Page> createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {
  int _selectedIndex = 1;

  static final List<Widget> _screens = <Widget>[

    Gift_Voucher(),
    LiveContest(),
   Shareing()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: appColor,
        currentIndex: _selectedIndex,
        selectedItemColor: boxColor,
        onTap: _onItemTapped, // Call _onItemTapped when an item is tapped
        items: [
          BottomNavigationBarItem(icon:
     CircleAvatar(
        radius: 15,
        backgroundColor: appColor,
        child: Image.asset('Assets/Images/cup.png'), // Replace with your image asset
      ),
      label: "home"
    ),
          BottomNavigationBarItem(icon:
          CircleAvatar(
            radius: 15,
            backgroundColor: appColor,
            child: Image.asset('Assets/Images/HomeIcon.png'), // Replace with your image asset
          ),
label: "Home"
          ),BottomNavigationBarItem(icon: Icon(Icons.person_add_alt),label: "Home"),

        ],
      ),
    );
  }
}
