import 'package:flutter/material.dart';

import '../Common/BoldText.dart';
import '../Common/Colors.dart';

class PracticeCont extends StatefulWidget {
  const PracticeCont({super.key});

  @override
  State<PracticeCont> createState() => _PracticeContState();
}

class _PracticeContState extends State<PracticeCont> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: appColor,
          title: BoldText(name: "PRACTICE CONTEST",fontsize: 22,),
          centerTitle: true,
          leading: Icon(Icons.menu),
          actions: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.yellow,
            )
          ],
        )
    );
  }
}
