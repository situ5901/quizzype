import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzype001/Common/Colors.dart';
import 'package:quizzype001/Common/TapButton.dart';
import 'package:quizzype001/UI/Home.dart';

import 'package:quizzype001/UI/Main_Page.dart';
import 'package:quizzype001/UI/Navbar.dart';
import 'package:quizzype001/UI/Profile/profileController.dart';
import '../../Common/BoldText.dart';
import '../../model/UserModels/StudentModel.dart';
import '../Auth/login/Login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  String? selectedValue;
  String? selectedMedium;
  String? selectedBoard;
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RadioListTile<String>(
                                  title: BoldText(name:'SCHOOL',fontsize: 16,color: boxColor,),
                                  value: 'SCHOOL',
                                  groupValue: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value;
                                      selectedValue =controller.selectEducation;

                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: BoldText(name:'COLLEGE',fontsize: 16,color: boxColor,),
                                  value: 'COLLEGE',
                                  groupValue: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value;
                                      selectedValue =controller.selectEducation;

                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: BoldText(name:'INSTITUTE',fontsize: 16,color: boxColor,),
                                  value: 'INSTITUTE',
                                  groupValue: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value;
                                      selectedValue =controller.selectEducation;

                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                BoldText(name: 'Full Name', fontsize: 20,color: boxColor,),

                                Container(
                                  height: 30,
                                  child: TextFormField(
                                 controller:fullnameController,
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
                                    onChanged: (value) {
                                      controller.fullname = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                BoldText(name: 'MOBILE NUMBER', fontsize: 20,color: boxColor,),

                                Container(
                                  height: 30,
                                  child: TextFormField(
                                    controller: phoneNumberController,
                                    decoration: InputDecoration(
                                      hintText: "--",
                                    ),
                                    onChanged: (value) {

                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                BoldText(name: 'SCHOOL NAME', fontsize: 20,color: boxColor,),

                                Container(
                                  height: 30,
                                  child: TextFormField(
                                    controller: schoolNameController,
                                    decoration: InputDecoration(
                                      hintText: "--",
                                    ),
                                    onChanged: (value) {
                                      controller.schoolName = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                BoldText(name: 'SCHOOL ADDRESS', fontsize: 20,color: boxColor,),

                                Container(
                                  height: 30,
                                  child: TextFormField(
                                    controller:schoolAddressController,
                                    decoration: InputDecoration(
                                      hintText: "--",
                                    ),
                                    onChanged: (value) {
                                      controller.schoolAddress = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                RadioListTile<String>(
                                  title: BoldText(name:'CBSE BOARD',fontsize: 16,color: boxColor,),
                                  value: 'CBSE_BOARD',
                                  groupValue: selectedBoard,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedBoard = value;
                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: BoldText(name:'ICSC BOARD',fontsize: 16,color: boxColor,),
                                  value: 'ICSC_BOARD',
                                  groupValue: selectedBoard,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedBoard = value;
                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: BoldText(name:'OTHER',fontsize: 16,color: boxColor,),
                                  value: 'Other', // Assuming this is the "OTHER" option
                                  groupValue: selectedBoard,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedBoard = value;
                                      if (value == 'Other') {
                                        // Update the TextController when OTHER is selected



                                        boardController.text = ''; // Clear existing text if any
                                      }
                                    });
                                  },
                                ),

                                TextFormField(
                                  controller: boardController,
                                  decoration: InputDecoration(
                                    hintText: "ENTER YOUR BOARD NAME",
                                  ),
                                  onChanged: (value) {
                                    controller.boardOption = value;
                                  },
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                BoldText(name: 'CLASS', fontsize: 20,color: boxColor,),

                                Container(
                                  height: 30,
                                  child: TextFormField(
                                    controller: classController,
                                    decoration: InputDecoration(
                                      hintText: "--",
                                    ),
                                    onChanged: (value) {
                                      controller.classvalue = value;
                                    },
                                  ),
                                ),
                                RadioListTile<String>(
                                  title: BoldText(name:'ENGLISH MEDIUM',fontsize: 16,color: boxColor,),
                                  value: 'English_Medium',
                                  groupValue: selectedMedium,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedMedium = value;
                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: BoldText(name:'HINDI MEDIUM',fontsize: 16,color: boxColor,),
                                  value: 'Hindi_Medium',
                                  groupValue: selectedMedium,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedMedium = value;
                                    });
                                  },
                                ),
                                // For Medium Selection
                                RadioListTile<String>(
                                  title: BoldText(name:'OTHER',fontsize: 16,color: boxColor,),
                                  value: 'Other', // Assuming this is the "OTHER" option
                                  groupValue: selectedMedium,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedMedium = value;
                                      if (value == 'Other') {




                                        // Update the TextController when OTHER is selected
                                        mediumController.text = ''; // Clear existing text if any
                                      }
                                    });
                                  },
                                ),
                                Container(
                                  height: 30,
                                  child: TextFormField(
                                    controller: mediumController,
                                    decoration: InputDecoration(
                                        hintText: 'ENTER YOUR MEDIUM NAME'
                                    ),
                                    onChanged: (value) {
                                      controller.mediumName = value;
                                    },
                                  ),
                                ),

                                SizedBox(
                                  height: 12,
                                ),
                                BoldText(name: 'Enter Adhar', fontsize: 20,color: boxColor,),

                                Container(
                                  height: 30,
                                  child: TextFormField(
                                    controller:aadharcardController,
                                    decoration: InputDecoration(
                                      hintText: "--",
                                    ),
                                    onChanged: (value) {
                                      controller.aadharcard = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                          RoundedButton(
                            buttonColor: boxColor,
                            title: "SUBMIT",
                            onTap: () {

                              // Assign values
                               controller.selectEducation = selectedValue! ;
                               controller.fullname = fullnameController.text;
                             controller.address =  addressController.text ;
                              controller.phoneNumber = phoneNumberController.text;

                              controller.schoolName =schoolNameController.text;
                               controller.schoolAddress = schoolAddressController.text;
                              controller.aadharcard = aadharcardController.text ;
                               controller.classvalue = classController.text;

                              // Update the selected board and medium
                              if (selectedBoard == 'Other') {
                                controller.boardOption = boardController.text ?? ''; // Use the text from the TextField
                              } else {
                                controller.boardOption = selectedBoard ?? ''; // Use the selected value
                              }

                              if (selectedMedium == 'Other') {
                                controller.mediumName = mediumController.text ?? ''; // Use the text from the TextField
                              } else {
                                controller.mediumName = selectedMedium ?? ''; // Use the selected value
                              }









                              // Update the controller with the new details
                              final profileController = Get.find<ProfileController>();

                              profileController.postStudentDetails();
                            },
                          )


                          ],
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
                                child: TextFormField(
                                  controller: phoneNumberController,
                                  decoration: InputDecoration(
                                    hintText: "--",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              BoldText(name: 'DATE OF BIRTH', fontsize: 20,color: boxColor,),

                              Container(
                                height: 30,
                                child: TextFormField(
                                  controller: dobController,
                                  decoration: InputDecoration(
                                    hintText: "--",
                                  ),
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
                                    controller.phoneNumber1 =  phoneNumberController.text;

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
