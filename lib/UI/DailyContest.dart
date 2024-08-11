import 'package:flutter/material.dart';

import '../Common/BoldText.dart';
import '../Common/Colors.dart';

class DailyContest extends StatefulWidget {
  const DailyContest({super.key});

  @override
  State<DailyContest> createState() => _DailyContestState();
}

class _DailyContestState extends State<DailyContest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: appColor,
          title: BoldText(name: "DAILY CONTEST",fontsize: 22,),
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
