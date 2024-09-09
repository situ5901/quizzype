import 'package:flutter/material.dart';
import 'package:quizzype001/UI/Contest_Details.dart';
import 'package:quizzype001/UI/Leaderboard.dart';


void main() => runApp(Daily());

class Daily extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Monthly Contest',
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContestDetails()),
            );
          },
        ),
        title: Text('Daily Contest',),
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: Image.asset('Assets/Images/Money.png'),
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
                    Text(
                      "* You can participate in multiple contests between the timeline",
                      style: TextStyle(
                        fontSize: 11.0, // Set the desired font size
                        color: Colors.red,
                        fontStyle: FontStyle.italic// Optional: set text color
                      ),
                    ),
                    Text(
                      "*your rank will show in leaderboard",
                      style: TextStyle(
                        fontSize: 11.0,
                        color: Colors.red,
                        fontStyle: FontStyle.italic
                      ),
                    )
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Leaderboard()),
                    );

                  },
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