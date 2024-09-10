import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzype001/routes/approutes.dart';
import 'package:vibration/vibration.dart';  // Import vibration package
import 'package:quizzype001/UI/GK%20Quiz/gkquizcontoller.dart';
import 'package:quizzype001/domain/service/app/app_service_imports.dart';
import '../../Common/BoldText.dart';
import '../../Common/Colors.dart';
import '../MegaContest.dart';

class GK_QUIZ extends StatefulWidget {
  const GK_QUIZ({super.key});

  @override
  State<GK_QUIZ> createState() => _GK_QUIZState();
}

class _GK_QUIZState extends State<GK_QUIZ> {
  int _questionNumber = 1;
  late GkQuizController controller;
  String? selectedOption;
  bool isAnswerSelected = false;
  bool isAnswerCorrect = false;

  @override
  void initState() {
    super.initState();
    controller = Get.put(GkQuizController());
  }

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
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'You have Scored! [${controller.score}]',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Get.offNamed(AppRoutes.leaderBoard);
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
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
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
                      Navigator.of(context).pop();
                    },
                    child: Text('Stay'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
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
  void _handleOptionSelection(String option) {
    if (!isAnswerSelected) {
      setState(() {
        selectedOption = option;  // Ensure selectedOption is set here
        isAnswerSelected = true;
        isAnswerCorrect = selectedOption == controller.quizQuestion?.correctAnswer;

        if (!isAnswerCorrect) {
          Vibration.vibrate(duration: 500);
        }
      });

      controller.selectOption(option);  // Also update in controller
    }
  }


  void _handleNextQuestion() async {
    if (selectedOption != null && controller.quizQuestion != null) {
      await controller.postAnswer();

      if (_questionNumber < 10) {
        setState(() {
          _questionNumber++;
          isAnswerSelected = false;
          selectedOption = null;
          controller.loadData();  // Ensure this loads the next question correctly
        });
      } else {
        await controller.getScore();
        _showResultBottomSheet();
      }
    } else {
      print("Question ID or selected option is null");
    }
  }




  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _showExitConfirmationBottomSheet();
        return false;
      },
      child: GetBuilder<GkQuizController>(
        builder: (controller) {
          final correctAnswer = controller.quizQuestion?.correctAnswer;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: appColor,
              centerTitle: true,
              title: BoldText(name: "GK QUIZ", fontsize: 22, color: Colors.white),
              leading: Icon(Icons.menu, color: Colors.white),
            ),
            body: controller.isLoading
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 100,
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
                        SizedBox(height: 8),
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
                          width: double.infinity, // Full width
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.blue,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0), // Add some padding for better appearance
                            child: Text(
                              "Q. ${controller.quizQuestion?.question ?? ''}", // Prefix "Q."
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              softWrap: true, // Allows text to wrap within container width
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        _buildListAnswer(
                          controller.quizQuestion?.options ?? [],
                          _handleOptionSelection,
                          selectedOption,
                          correctAnswer, // Pass the correct answer here
                        ),
                        SizedBox(height: 16),
                        Align(
                          alignment: Alignment.topRight,
                          child: isAnswerSelected
                              ? GestureDetector(
                            onTap: _handleNextQuestion,
                            child: BoldText(
                              name: "NEXT --->",
                              color: Colors.black,
                              fontsize: 20,
                            ),
                          )
                              : SizedBox.shrink(), // Hide button if no answer is selected
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _buildListAnswer(List<String> options, Function(String) onSelected, String? selectedOption, String? correctAnswer) {
  return Column(
    children: options.asMap().entries.map((entry) {
      int index = entry.key; // Get index for numbering
      String option = entry.value;

      final bool isSelected = option == selectedOption;
      final bool isOptionCorrect = option == correctAnswer;

      return GestureDetector(
        onTap: () => onSelected(option),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          decoration: BoxDecoration(
            color: isSelected
                ? isOptionCorrect
                ? Colors.green.withOpacity(0.1) // Green for correct answer
                : Colors.red.withOpacity(0.1) // Red for wrong answer
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: isSelected
                  ? isOptionCorrect
                  ? Colors.green
                  : Colors.red
                  : Colors.grey,
              width: 2.0,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Serial number part
              Text(
                "${index + 1}.",  // Displaying index + 1 for numbering
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10.0), // Add space between number and option

              // Answer text part
              Expanded(
                child: Text(
                  option,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: isSelected
                        ? isOptionCorrect
                        ? Colors.green
                        : Colors.red
                        : Colors.black,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList(),
  );
}
