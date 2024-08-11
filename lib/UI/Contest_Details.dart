import 'package:flutter/material.dart';
import 'package:quizzype001/UI/Daily.dart';
import 'package:quizzype001/UI/Monthly.dart';

void main() => runApp(ContestDetails());

class ContestDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mega Contest',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mega Contest',),
        backgroundColor: Colors.blue,
        leading: Icon(Icons.menu),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 20), // Add this line
        iconTheme: IconThemeData(color: Colors.white), // Add this line
        actions: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: Image.asset('Assets/Images/Money.png'), // Replace 'assets/coin.png' with the actual path
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'CONTEST DETAILS',
                style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Set the border color to black
                    width: 2.0, // Adjust the width as needed
                  ),
                  borderRadius: BorderRadius.circular(8.0), // Optional: adds rounded corners
                ),
                child: Column(
                  children: [
                    Text('WHO CAN PARTICIPATE?', style: TextStyle(fontWeight: FontWeight.bold)),

                    Container(
                      height: 1,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    _ContestRow('SCHOOL STUDENTS', '28,29,30 MAY',),
                    _ContestRow('COLLEGE STUDENTS', '25,26,27 MAY'),
                    _ContestRow('COLLEGE STUDENTS', '25,26 MAY'),
                    _ContestRow('COLLEGE STUDENTS', '20,21,22 MAY'),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25),
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'MEGA PRIZE MONEY',
                            style: TextStyle(
                              fontSize: 35,
                              color: Colors.blue,
                              fontStyle: FontStyle.italic, // use the Bangers font family
                              fontWeight: FontWeight.bold, // make the font bold
                            ),
                          ),
                          TextSpan(
                            text: '🎁',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.yellow, // increase the font size of the emoji
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 77.0 ,left: 58.0, right: 24.0), // Add this line
                  padding: EdgeInsets.all(16.0),
                  child: RichText(
                    text: TextSpan(
                      text: '✨WIN UPTO 1 CRORE✨',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black87,
                        fontFamily: 'Bangers',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20), // Add a margin top of 20
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button color
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Button size
                      textStyle: TextStyle(fontSize: 12, color: Colors.white), // Button text size and color
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // Increased border radius
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Monthly()),
                      );
                    },                       child: Text('MONTHLY CONTEST', style: TextStyle(color: Colors.white)),                  ),
                  SizedBox(width: 8), // Space between buttons
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button color
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Button size
                      textStyle: TextStyle(fontSize: 12, color: Colors.white), // Button text size and color
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), // Increased border radius
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Daily()),
                      );
                    },                    child: Text('DAILY CONTEST',style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  // Yellow
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'REGISTRATION FEE - 365',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black87),
                    ),
                    Row(
                      children: [
                        Text(
                          '₹Join Now',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,backgroundColor: Colors.yellow,color: Colors.black87),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:45,left: 20,right: 20),
              alignment: Alignment.centerLeft, // Add this line
              child: Text(
                'UPCOMING EVENTS',
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
      Container(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            side: BorderSide(color: Colors.grey),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), // Add this line
          ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('Assets/Images/jk.png'), // Replace 'assets/gift.png' with the actual path
                          SizedBox(width: 10.0),
                          Text('MONTHLY CONTEST'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Join Now', style: TextStyle(color: Colors.black87,backgroundColor: Colors.yellow)), // Join Now text with yellow color
                          SizedBox(width: 10.0),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ],
                  )

              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ContestRow(String participant, String date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(participant),
        Text(date, style: TextStyle(color: Color(0xFFF7B800))), // Yellow
      ],
    );
  }
}