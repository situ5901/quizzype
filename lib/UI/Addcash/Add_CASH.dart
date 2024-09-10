import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzype001/Common/TapButton.dart';
import 'package:quizzype001/UI/Addcash/controller.dart';
import 'package:quizzype001/UI/GK%20Quiz/GK_QUIZ.dart';

import '../../Common/BoldText.dart';
import '../../Common/Colors.dart';
import 'package:quizzype001/routes/approutes.dart';

class ADD_CASh extends StatefulWidget {
  const ADD_CASh({super.key});

  @override
  State<ADD_CASh> createState() => _ADD_CAShState();
}

class _ADD_CAShState extends State<ADD_CASh> {
  final TextEditingController _amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Key for the Form widget

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCashController>(
      init: AddCashController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appColor,
            centerTitle: true,
            title: BoldText(name: "ADD CASH", fontsize: 22, color: Colors.white),
            leading: Icon(Icons.menu, color: Colors.white),
            actions: [
              Container(
                height: 20,
                width: 50,
                color: Colors.white,
                child: BoldText(name:"₹${controller.balance}", fontsize: 18, color: Colors.yellow),
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Image.asset('Assets/Images/Money.png'),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey, // Assign the key to the Form widget
                child: Column(
                  children: [

                    SizedBox(height: 30),
                    TextFormField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefix: Text(
                          "₹ ",
                          style: TextStyle(fontSize: 25),
                        ),
                        hintText: 'ENTER AMOUNT',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 25),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style: TextStyle(fontSize: 25),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an amount';
                        }
                        final amount = int.tryParse(value);
                        if (amount == null) {
                          return 'Invalid amount';
                        }
                        if (amount < 10) {
                          return 'Minimum amount is ₹10';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        amountButton('100', controller),
                        amountButton('200', controller),
                        amountButton('300', controller),
                      ],
                    ),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          final amount = int.tryParse(_amountController.text) ?? 0;
                          controller.addCashAndCreateContest(amount);
                          _amountController.clear();
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BoldText(name: "PROCEED", fontsize: 22, color: Colors.yellow),
                            Icon(Icons.arrow_forward, color: Colors.white),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget amountButton(String amount, AddCashController controller) {
    return GestureDetector(
      onTap: () {
        _amountController.text = amount; // Update the TextEditingController
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.currency_rupee, color: Colors.black),
            BoldText(name: amount, fontsize: 22, color: Colors.yellow),
            Icon(Icons.add_outlined, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final VoidCallback onJoinNow; // Add a callback parameter

  CustomDialog({required this.onJoinNow}); // Initialize the callback

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: 300.0,
        width: 350.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('Assets/Images/done.png', height: 150, width: 120),
            BoldText(name: "SUCCESSFULLY ADDED CASH IN WALLET", color: Colors.blue, fontsize: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundedButton(
                buttonColor: appColor,
                title: "JOIN NOW",
                onTap: () {
                  onJoinNow(); // Execute the callback
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



