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
                                  value: 'Option 1',
                                  groupValue: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value;

                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: BoldText(name:'COLLEGE',fontsize: 16,color: boxColor,),
                                  value: 'Option 2',
                                  groupValue: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value;

                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: BoldText(name:'INSTITUTE',fontsize: 16,color: boxColor,),
                                  value: 'Option 3',
                                  groupValue: selectedValue,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value;

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
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                RadioListTile<String>(
                                  title: BoldText(name:'CBSE BOARD',fontsize: 16,color: boxColor,),
                                  value: 'Option 1',
                                  groupValue: selectedBoard,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedBoard = value;
                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: BoldText(name:'ICSC BOARD',fontsize: 16,color: boxColor,),
                                  value: 'Option 2',
                                  groupValue: selectedBoard,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedBoard = value;
                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: BoldText(name:'OTHER',fontsize: 16,color: boxColor,),
                                  value: 'Option 3',
                                  groupValue: selectedBoard,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedBoard = value;
                                    });
                                  },
                                ),
                                TextFormField(
                                  controller: boardController,
                                  decoration: InputDecoration(
                                    hintText: "ENTER YOUR BOARD NAME",
                                  ),
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
                                  ),
                                ),
                                RadioListTile<String>(
                                  title: BoldText(name:'ENGLISH MEDIUM',fontsize: 16,color: boxColor,),
                                  value: 'Option 1',
                                  groupValue: selectedMedium,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedMedium = value;
                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: BoldText(name:'HINDI MEDIUM',fontsize: 16,color: boxColor,),
                                  value: 'Option 2',
                                  groupValue: selectedMedium,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedMedium = value;
                                    });
                                  },
                                ),
                                RadioListTile<String>(
                                  title: BoldText(name:'OTHER',fontsize: 16,color: boxColor,),
                                  value: 'Option 3',
                                  groupValue: selectedMedium,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedMedium = value;
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
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                RoundedButton(buttonColor:boxColor,
                                    title:"SUBMIT", onTap:(){
                                      final studentDetails = StudentDetails(
                                        selectEducation: selectedValue ?? '',
                                        fullname: fullnameController.text,
                                        address: addressController.text,
                                        phoneNumber: phoneNumberController.text,
                                        schoolName: schoolNameController.text,
                                        schoolAddress: schoolAddressController.text,
                                        boardOption: selectedBoard ?? '',
                                        classValue: classController.text,
                                        mediumName: mediumController.text,
                                        aadharcard: aadharcardController.text,
                                      );

                                      // Update the controller with the new details
                                      final profileController = Get.find<ProfileController>();
                                      profileController.studentDetails = studentDetails;
                                      profileController.postStudentDetails();
                                    }),
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
                                    Get.to(()=>Login_Page());
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
