import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart'; // Import vibration package
import 'package:quizzype001/UI/GK%20Quiz/gkquizcontoller.dart';
import '../../Common/BoldText.dart';
import '../../Common/Colors.dart';

class GK_QUIZ extends StatefulWidget {
  const GK_QUIZ({super.key});

  @override
  State<GK_QUIZ> createState() => _GK_QUIZState();
}

class _GK_QUIZState extends State<GK_QUIZ> {
  late GkQuizController controller;
  String? selectedOption;
  bool isAnswerSelected = false;
  bool isAnswerCorrect = false;

  @override
  void initState() {
    super.initState();
    controller = Get.put(GkQuizController());
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
        selectedOption = option; // Ensure selectedOption is set here
        isAnswerSelected = true;
        isAnswerCorrect =
            selectedOption == controller.quizQuestion?.correctAnswer;

        if (!isAnswerCorrect) {
          Vibration.vibrate(duration: 500);
        }
      });

      controller.selectOption(option); // Also update in controller
    }
  }

  void _handleNextQuestion() async {
    if (selectedOption != null) {
      await controller.handleNextQuestion(); // Call the new method
      setState(() {
        isAnswerSelected = false;
        selectedOption = null; // Reset selection
      });
    } else {
      print("No option selected");
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
          // Check if contest or players is null
          if (controller.contest == null || controller.contest!.players == null) {
            return Center(child: CircularProgressIndicator());
          }

          final correctAnswer = controller.quizQuestion?.correctAnswer;
          final players = controller.contest!.players;

          // Check if quizQuestion is null
          if (controller.quizQuestion == null) {
            return Center(child: Text("No question available."));
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: appColor,
              centerTitle: true,
              title: BoldText(name: "GK QUIZ", fontsize: 22, color: Colors.white),
              leading: Icon(Icons.menu, color: Colors.white),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(
                          value: controller.progress,
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                      Text(
                        '${controller.timeLeft}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
                        BoldText(
                          name: '${players[0].fullname} vs ${players[1].fullname}',
                          color: Colors.white,
                          fontsize: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(10, (index) {
                            return Icon(
                              Icons.circle,
                              color: index < controller.questionNumber
                                  ? Colors.yellow
                                  : Colors.white,
                            );
                          }),
                        ),
                        SizedBox(height: 8),
                        BoldText(
                          name: '${controller.questionNumber} out of 10',
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
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.blue,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Q${controller.questionNumber}. ${controller.quizQuestion?.question ?? ''}",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              softWrap: true,
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        _buildListAnswer(
                          controller.quizQuestion?.options ?? [],
                          _handleOptionSelection,
                          selectedOption,
                          correctAnswer,
                        ),
                        SizedBox(height: 16),
                        Align(
                          alignment: Alignment.center,
                          child: isAnswerSelected
                              ? GestureDetector(
                            onTap: _handleNextQuestion,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 15.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 2.0,
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(15)),
                              child: BoldText(
                                name: "NEXT",
                                color: Colors.black,
                                fontsize: 20,
                              ),
                            ),
                          )
                              : SizedBox.shrink(),
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

Widget _buildListAnswer(List<String> options, Function(String) onSelected,
    String? selectedOption, String? correctAnswer) {
  return Column(
    children: options.asMap().entries.map((entry) {
      int index = entry.key; // Get index for numbering
      String option = entry.value;

      final bool isSelected = option == selectedOption;
      final bool isOptionCorrect = option == correctAnswer;
      final bool showCorrectAnswer =
          selectedOption != null && selectedOption != correctAnswer;

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
                : (showCorrectAnswer && isOptionCorrect)
                ? Colors.green.withOpacity(
                0.1) // Green for correct answer when wrong answer is selected
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: isSelected
                  ? isOptionCorrect
                  ? Colors.green
                  : Colors.red
                  : (showCorrectAnswer && isOptionCorrect)
                  ? Colors.green
                  : Colors.grey,
              width: 2.0,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Serial number part
              Text(
                "${index + 1}.", // Displaying index + 1 for numbering
                style: TextStyle(
                  fontSize: 18,
                  color: isSelected
                      ? (isOptionCorrect
                      ? Colors.green
                      : Colors.red)
                      : Colors.black,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  option,
                  style: TextStyle(
                    fontSize: 18,
                    color: isSelected
                        ? (isOptionCorrect ? Colors.green : Colors.red)
                        : Colors.black,
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
