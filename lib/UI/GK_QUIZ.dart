import 'package:flutter/material.dart';
import '../Common/BoldText.dart';
import '../Common/Colors.dart';
import 'MegaContest.dart';

class GK_QUIZ extends StatefulWidget {
  const GK_QUIZ({super.key});

  @override
  State<GK_QUIZ> createState() => _GK_QUIZState();
}

class _GK_QUIZState extends State<GK_QUIZ> {
  int _questionNumber = 1;

  void _showResultBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 10),
                      Text(
                        'Check Result',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the bottom sheet
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'You have completed the quiz!',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the bottom sheet
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MegaContest()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showExitConfirmationBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Are you sure you want to leave the quiz?',
                        style: TextStyle(
                            fontSize: 16),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the bottom sheet
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'You will lose your progress.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the bottom sheet
                    },
                    child: Text('Stay'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the bottom sheet
                      Navigator.of(context).pop(); // Go back to the previous screen
                    },
                    child: Text('Leave'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _showExitConfirmationBottomSheet();
        return false; // Prevent the default back button behavior
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appColor,
          centerTitle: true,
          title: BoldText(name: "GK QUIZ", fontsize: 22, color: Colors.white),
          leading: Icon(Icons.menu, color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100, // Increased height to accommodate the count
                width: double.infinity,
                color: appColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(10, (index) {
                        return Icon(
                          Icons.circle,
                          color: index < _questionNumber
                              ? Colors.yellow
                              : Colors.white,
                        );
                      }),
                    ),
                    SizedBox(height: 8), // Add some spacing between dots and text
                    BoldText(
                      name: '$_questionNumber out of 10',
                      color: Colors.white,
                      fontsize: 16,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    Container(
                      width: 200,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                      ),
                      child: Row(
                        children: [
                          Image.asset("Assets/Images/kanak.png",
                              width: 50, height: 50),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BoldText(
                                  name: 'PRIZE POOL',
                                  color: Colors.black,
                                  fontsize: 16),
                              BoldText(
                                  name: 'Rs 50',
                                  color: Colors.black,
                                  fontsize: 16)
                            ],
                          ),
                          Image.asset("Assets/Images/kanak.png",
                              width: 50, height: 50)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: BoldText(
                          name: "WHO IS THE PRIME MINISTER OF INDIA?",
                          color: Colors.black,
                          fontsize: 22,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: BoldText(
                          name: "MANMOHAN SINGH",
                          color: Colors.blue,
                          fontsize: 22,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: BoldText(
                          name: "MANMOHAN SINGH",
                          color: Colors.blue,
                          fontsize: 22,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: BoldText(
                          name: "MANMOHAN SINGH",
                          color: Colors.blue,
                          fontsize: 22,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: BoldText(
                          name: "MANMOHAN SINGH",
                          color: Colors.blue,
                          fontsize: 22,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_questionNumber < 10) {
                              _questionNumber++;
                            } else {
                              _showResultBottomSheet();
                            }
                          });
                        },
                        child: BoldText(
                          name: "NEXT --->",
                          color: Colors.black,
                          fontsize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
