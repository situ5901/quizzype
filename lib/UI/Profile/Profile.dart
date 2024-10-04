import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzype001/Common/Colors.dart';
import 'package:quizzype001/Common/TapButton.dart';
import 'package:quizzype001/UI/HomeScreen/Home.dart';

import 'package:quizzype001/UI/Main_Page.dart';
import 'package:quizzype001/UI/Navbar.dart';
import 'package:quizzype001/UI/Profile/profileController.dart';
import '../../Common/BoldText.dart';
import '../Auth/login/Login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  String selectedValue = '';
  String selectedBoard = '';
  String selectedMedium = '';
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final TextEditingController schoolNameController = TextEditingController();
  final TextEditingController schoolAddressController = TextEditingController();
  final TextEditingController boardController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController mediumController = TextEditingController();
  final TextEditingController aadharcardController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  void navigateToTab(int tabIndex) {
    tabController.animateTo(tabIndex);


  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init:ProfileController(),
      builder: (controller){
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: BoldText(
                name: "MY PROFILE",
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
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 250,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300], // Background color of the TabBar
                      ),
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          color: boxColor, // Background color of the selected tab
                          borderRadius: BorderRadius.circular(8), // Match the container's border radius
                        ),
                        controller: tabController,
                        tabs: [
                          Tab(
                            text: "STUDENTS",
                          ),
                          Tab(
                            text: "OTHERS",
                          ),
                        ],
                        labelColor: Colors.white, // Selected tab text color
                        unselectedLabelColor: Colors.black,
                      ),
                    ),
                  ],
                ),

                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      // Students
                      // Contents of Tab 1
                      Container(
                        height:80,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RadioListTile<String>(
                                    title: BoldText(name: 'SCHOOL', fontsize: 16, color: Colors.black),
                                    value: 'School',
                                    groupValue: selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value!;
                                        controller.selectEducation = selectedValue;
                                      });
                                    },
                                  ),
                                  RadioListTile<String>(
                                    title: BoldText(name: 'COLLEGE', fontsize: 16, color: Colors.black),
                                    value: 'College',
                                    groupValue: selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value!;
                                        controller.selectEducation = selectedValue;
                                      });
                                    },
                                  ),
                                  RadioListTile<String>(
                                    title: BoldText(name: 'INSTITUTE', fontsize: 16, color: Colors.black),
                                    value: 'Institute',
                                    groupValue: selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value!;
                                        controller.selectEducation = selectedValue;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 12),
                                  BoldText(name: 'Full Name', fontsize: 20, color: Colors.black),
                                  TextFormField(
                                    controller: fullnameController,
                                    decoration: InputDecoration(hintText: "--"),
                                    onChanged: (value) {
                                      controller.fullname = value;
                                    },
                                  ),
                                  SizedBox(height: 12),
                                  BoldText(name: 'ADDRESS', fontsize: 20, color: Colors.black),
                                  TextFormField(
                                    controller: addressController,
                                    decoration: InputDecoration(hintText: "--"),
                                    onChanged: (value) {
                                      controller.address = value;
                                    },
                                  ),
                                  SizedBox(height: 12),
                                  BoldText(name: 'MOBILE NUMBER', fontsize: 20, color: Colors.black),
                                  TextFormField(
                                    initialValue: controller.phoneNumber,

                                    decoration: InputDecoration(hintText: "--"),
                                    readOnly: true,
                                    onChanged: (value) {
                                      controller.phoneNumber ;
                                    },
                                  ),
                                  SizedBox(height: 12),
                                  BoldText(name: 'SCHOOL NAME', fontsize: 20, color: Colors.black),
                                  TextFormField(
                                    controller: schoolNameController,
                                    decoration: InputDecoration(hintText: "--"),
                                    onChanged: (value) {
                                      controller.schoolName = value;
                                    },
                                  ),
                                  SizedBox(height: 12),
                                  BoldText(name: 'SCHOOL ADDRESS', fontsize: 20, color: Colors.black),
                                  TextFormField(
                                    controller: schoolAddressController,
                                    decoration: InputDecoration(hintText: "--"),
                                    onChanged: (value) {
                                      controller.schoolAddress = value;
                                    },
                                  ),
                                  SizedBox(height: 12),
                                  RadioListTile<String>(
                                    title: BoldText(name: 'CBSE BOARD', fontsize: 16, color: Colors.black),
                                    value: 'CBSE_Board',
                                    groupValue: selectedBoard,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedBoard = value!;
                                        controller.boardOption = selectedBoard;
                                      });
                                    },
                                  ),
                                  RadioListTile<String>(
                                    title: BoldText(name: 'ICSE BOARD', fontsize: 16, color: Colors.black),
                                    value: 'ICSE_Board',
                                    groupValue: selectedBoard,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedBoard = value!;
                                        controller.boardOption = selectedBoard;
                                      });
                                    },
                                  ),
                                  RadioListTile<String>(
                                    title: BoldText(name: 'OTHER', fontsize: 16, color: Colors.black),
                                    value: 'Other',
                                    groupValue: selectedBoard,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedBoard = value!;
                                        if (selectedBoard == 'Other') {
                                          boardController.clear(); // Clear if OTHER is selected
                                        }
                                      });
                                    },
                                  ),
                                  TextFormField(
                                    controller: boardController,
                                    decoration: InputDecoration(hintText: "ENTER YOUR BOARD NAME"),
                                    onChanged: (value) {
                                      controller.boardOption = value;
                                    },
                                  ),
                                  SizedBox(height: 12),
                                  BoldText(name: 'CLASS', fontsize: 20, color: Colors.black),
                                  DropdownButtonFormField<int>(
                                    value: int.tryParse(classController.text),  // Initialize with the current value of classController
                                    decoration: InputDecoration(hintText: "--"),
                                    items: List.generate(12, (index) {
                                      return DropdownMenuItem(
                                        value: index + 1,
                                        child: Text((index + 1).toString()),
                                      );
                                    }),
                                    onChanged: (value) {
                                      if (value != null) {
                                        classController.text = value.toString();  // Update classController with selected value
                                        controller.classvalue = value.toString();  // Update controller with selected value
                                      }
                                    },
                                  ),

                                  RadioListTile<String>(
                                    title: BoldText(name: 'ENGLISH MEDIUM', fontsize: 16, color: Colors.black),
                                    value: 'English_Medium',
                                    groupValue: selectedMedium,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedMedium = value!;
                                        controller.mediumName = selectedMedium;
                                      });
                                    },
                                  ),
                                  RadioListTile<String>(
                                    title: BoldText(name: 'HINDI MEDIUM', fontsize: 16, color: Colors.black),
                                    value: 'Hindi_Medium',
                                    groupValue: selectedMedium,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedMedium = value!;
                                        controller.mediumName = selectedMedium;
                                      });
                                    },
                                  ),
                                  RadioListTile<String>(
                                    title: BoldText(name: 'OTHER', fontsize: 16, color: Colors.black),
                                    value: 'Other',
                                    groupValue: selectedMedium,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedMedium = value!;
                                        if (selectedMedium == 'Other') {
                                          mediumController.clear(); // Clear if OTHER is selected
                                        }
                                      });
                                    },
                                  ),
                                  TextFormField(
                                    controller: mediumController,
                                    decoration: InputDecoration(hintText: 'ENTER YOUR MEDIUM NAME'),
                                    onChanged: (value) {
                                      controller.mediumName = value;
                                    },
                                  ),
                                  SizedBox(height: 12),
                                  BoldText(name: 'Enter Aadhar', fontsize: 20, color: Colors.black),
                                  TextFormField(
                                    controller: aadharcardController,
                                    decoration: InputDecoration(hintText: "--"),
                                    onChanged: (value) {
                                      controller.aadharcard = value;
                                    },
                                  ),
                                  SizedBox(height: 8),
                                  RoundedButton(buttonColor: boxColor,
                                    title: 'SUBMIT',
                                    onTap: () {
                                      // Assign values before submission
                                      controller.selectEducation = selectedValue;
                                      controller.fullname = fullnameController.text;
                                      controller.address = addressController.text;

                                      controller.schoolName = schoolNameController.text;
                                      controller.schoolAddress = schoolAddressController.text;
                                      controller.classvalue = classController.text;
                                      controller.aadharcard = aadharcardController.text;

                                      // Handle board and medium options
                                      if (selectedBoard == 'Other') {
                                        controller.boardOption = boardController.text;
                                      }
                                      if (selectedMedium == 'Other') {
                                        controller.mediumName = mediumController.text;
                                      }

                                      // Post details using controller method
                                      controller.postStudentDetails();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ),
                      ),
                      // Contents of Tab 2
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BoldText(name: 'Full Name', fontsize: 20,color: boxColor,),

                              Container(
                                height: 30,
                                child: TextFormField(
                                  controller: fullnameController,
                                  decoration: InputDecoration(
                                    hintText: "--",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              BoldText(name: 'ADDRESS', fontsize: 20,color: boxColor,),

                              Container(
                                height: 30,
                                child: TextFormField(
                                  controller: addressController,
                                  decoration: InputDecoration(
                                    hintText: "--",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              BoldText(name: 'EMAIL ADDRESS', fontsize: 20,color: boxColor,),

                              Container(
                                height: 30,
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: "--",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              BoldText(name: 'CITY', fontsize: 20,color: boxColor,),

                              Container(
                                height: 30,
                                child: TextFormField(
                                  controller: cityController,
                                  decoration: InputDecoration(
                                    hintText: "--",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              BoldText(name: 'STATE', fontsize: 20,color: boxColor,),

                              Container(
                                height: 30,
                                child: TextFormField(
                                  controller: stateController,
                                  decoration: InputDecoration(
                                    hintText: "--",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              BoldText(name: 'PINCODE', fontsize: 20,color: boxColor,),

                              Container(
                                height: 30,
                                child: TextFormField(
                                  controller: pincodeController,
                                  decoration: InputDecoration(
                                    hintText: "--",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              BoldText(name: 'PHONE NUMBER', fontsize: 20,color: boxColor,),

                              Container(
                                height: 30,
                                child:                                   TextFormField(
                                  initialValue: controller.phoneNumber,

                                  decoration: InputDecoration(hintText: "--"),
                                  readOnly: true,
                                  onChanged: (value) {
                                    controller.phoneNumber ;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              BoldText(name: 'DATE OF BIRTH', fontsize: 20, color: boxColor),

                              Container(
                                height: 30,
                                child: TextFormField(
                                  controller: dobController,
                                  decoration: InputDecoration(
                                    hintText: "--",
                                    suffixIcon: Icon(Icons.calendar_today),  // Icon for date picker
                                  ),
                                  readOnly: true,  // Prevents manual editing
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),  // Current date
                                      firstDate: DateTime(1900),    // Earliest selectable date
                                      lastDate: DateTime.now(),     // Latest selectable date
                                    );

                                    if (pickedDate != null) {
                                      // Format the date as a string (e.g., dd/MM/yyyy)
                                      String formattedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                                      dobController.text = formattedDate;  // Set the value in the controller
                                      controller.dob = formattedDate;      // Update controller with the formatted date string
                                    }
                                  },
                                ),
                              ),

                              SizedBox(
                                height: 16,
                              ),
                              RoundedButton(buttonColor: boxColor,
                                  title: 'SUBMIT', onTap: (){
                                    controller.fullname = fullnameController.text;
                                    controller.address =  addressController.text;
                                    controller.email =  emailController.text;
                                    controller.pincode =  pincodeController.text;
                                    controller.city =  cityController.text;
                                    controller.state =  stateController.text;
                                    controller.dob =  dobController.text;


                                    // Update the controller with the new details
                                    final profileController = Get.find<ProfileController>();

                                    profileController.postUserDetails();
                                  })
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
