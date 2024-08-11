import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzype001/Common/BoldText.dart';
import 'package:quizzype001/Common/Colors.dart';
import 'package:quizzype001/Common/TapButton.dart';
import 'package:quizzype001/Common/Colors.dart';

import 'Profile.dart';

class PasswordUI extends StatefulWidget {
  const PasswordUI({super.key});

  @override
  State<PasswordUI> createState() => _PasswordUIState();
}

class _PasswordUIState extends State<PasswordUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: BoldText(
            name: "Set Unlock Password",
            fontsize: 20,
            color: Colors.white,
          ),
          backgroundColor: boxColor,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoldText(name: "TYPE AN UNLOCK PASSWORD", fontsize: 22,color: Colors.grey,),
            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                CircularTextField(radius: 15),
                SizedBox(
                  width: 6,
                ),
                CircularTextField(radius: 15),
                SizedBox(
                  width: 6,
                ),
                CircularTextField(radius: 15),
                SizedBox(
                  width: 6,
                ),
                CircularTextField(radius: 15),


              ],
        ),
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RoundedButton(
                  buttonColor: boxColor,
                  title: "SUBMIT",fontsize: 28,
                  onTap: (){
                    Get.to(()=> ProfilePage());
                  }),
            )
          ]
      ),
    )
    );
  }
}

class CircularTextField extends StatefulWidget {
  final double radius;
  final bool lastField;

  const CircularTextField({Key? key, required this.radius, this.lastField = false}) : super(key: key);

  @override
  _CircularTextFieldState createState() => _CircularTextFieldState();
}

class _CircularTextFieldState extends State<CircularTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _controller.addListener(() {
      setState(() {
        // Limit text input to one character
        if (_controller.text.length > 1) {
          _controller.text = _controller.text.substring(0, 1);
        }
      });
    });
    _controller.addListener(_navigateNextField);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _navigateNextField() {
    if (_controller.text.isNotEmpty && widget.lastField == false) {
      FocusScope.of(context).nextFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.radius * 2,
      height: widget.radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black),
        color: _controller.text.isNotEmpty ? boxColor: null,
      ),
      child: Center(
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          maxLength: 1, // Allow only one character
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
          style: TextStyle(fontSize: widget.radius * 0.7),
          onChanged: (value) {
            // Handle text changes if needed
          },
        ),
      ),
    );
  }
}
