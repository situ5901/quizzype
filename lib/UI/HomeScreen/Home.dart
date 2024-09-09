import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quizzype001/Common/BoldText.dart';
import 'package:quizzype001/Common/PlainText.dart';
import 'package:quizzype001/Common/TapButton.dart';
import 'package:quizzype001/UI/DailyContest.dart';
import 'package:quizzype001/UI/HomeScreen/controller.dart';
import 'package:quizzype001/UI/Main_Page.dart';
import 'package:quizzype001/UI/MegaContest.dart';
import 'package:quizzype001/domain/repository/repository_imports.dart';
import 'package:quizzype001/domain/service/app/app_service_imports.dart';
import '../../Common/Colors.dart';
import '../../routes/approutes.dart';
import '../Addcash/Add_CASH.dart';
import '../PracticeContest.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> imagePaths = [
    "Assets/Images/1.jpeg",
    "Assets/Images/mega.png",
    "Assets/Images/Dailycont.png",
    "Assets/Images/Practices.png",
  ];
  var itemId = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDrawerOpen = false;

  void _toggleDrawer() {
    if (_isDrawerOpen) {
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      _scaffoldKey.currentState?.openDrawer();
    }
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  final DatabaseService databaseService = Get.find<DatabaseService>();

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return GetBuilder(
      init: HomeController(),
        builder: (controller){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: appColor,
            centerTitle: true,
            title: BoldText(
              name: "QUIZYPE",
              fontsize: 22,
              color: Colors.white,
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "₹100",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Get.to(() => ADD_CASh());
                },
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'Assets/Images/Money.png',
                  ),
                ),
              )
            ],
          ),
          drawer: Drawer(
            width: 250, // Set the width of the Drawer
            child: Container(
              margin: EdgeInsets.only(bottom: 20), // Set the bottom margin to 20
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(controller.userModel!.fullname?? ""),
                    accountEmail: Text(controller.userModel!.email ?? ""),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.indigo.shade900,
                      child: Text(
                        "SS",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.userScreen);
                    },
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Profile"),
                    ),
                  ),
                  ListTile(
                    onTap: (){
                      UserRepository().fetchQuestion();
                    },
                    leading: Icon(Icons.score),
                    title: Text("Score"),
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text("Notification"),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Setting"),
                  ),
                  ListTile(
                    onTap: () async{
                      await databaseService.putIsLogin(false);
                      Get.offAllNamed(AppRoutes.login);
                    },
                    leading: Icon(Icons.logout),
                    title: Text("Log Out"),
                  )
                ],
              ),
            ),
          ),      body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        color: appColor,
                        height: 200,
                        child: Center(
                          child: Container(
                            height: 50,
                            width: 140,
                            decoration: BoxDecoration(
                              color: boxColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 2,
                                color: boxColor,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: BoldText(
                                name: "HI BUDDY",
                                fontsize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 50,
                    right: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Container(
                        height: 90,
                        width: Size.width * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.black,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BoldText(
                                  name: "PLAY QUIZYPE",
                                  fontsize: 18,
                                  color: Colors.black,
                                ),
                                BoldText(
                                  name: "AND WIN UPTO",
                                  fontsize: 18,
                                  color: Colors.black,
                                ),
                                BoldText(
                                  name: "1 CRORE CASH",
                                  fontsize: 18,
                                  color: Colors.yellow,
                                ),
                              ],
                            ),
                            Image.asset('Assets/Images/img_1.png'),
                            Image.asset('Assets/Images/img.png')
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.greenAccent),
                  ),
                  child: Center(
                    child: BoldText(
                      name: 'CONTEST',
                      color: Colors.green,
                      fontsize: 22,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 380,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                          Orientation.portrait
                          ? 2
                          : 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Handle navigation based on the clicked item
                          switch (index) {
                            case 0:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Main_Page()),
                              );
                              break;
                            case 1:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MegaContest()),
                              );
                              break;
                            case 2:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DailyContest()),
                              );
                              break;
                            case 3:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PracticeCont()),
                              );
                              break;
                            default:
                            // Handle default case or any additional items
                              break;
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(imagePaths[
                              index]), // Accessing image path based on index
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Center(
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.greenAccent),
                  ),
                  child: Center(
                    child: BoldText(
                      name: 'DEMO CONTEST',
                      color: Colors.green,
                      fontsize: 22,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: appColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      PlainText(
                        name: '2 PLAYERS - WINNER',
                        fontsize: 12,
                        color: Colors.black,
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              BoldText(name: 'PRIZE POOL', fontsize: 12),
                              Text(
                                'Rs. 50',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                ),
                              )
                            ],
                          ),
                          Container(
                            color: Colors.grey,
                            child: Row(
                              children: [
                                Icon(Icons.watch_later_outlined),
                                Text("3M:05")
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              BoldText(name: 'FREE', fontsize: 12),
                              Text(
                                'Rs. FREE',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: appColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      PlainText(
                        name: '2 PLAYERS - WINNER',
                        fontsize: 12,
                        color: Colors.black,
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              BoldText(name: 'PRIZE POOL', fontsize: 12),
                              Text(
                                'Rs. 50',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                ),
                              )
                            ],
                          ),
                          Container(
                            color: Colors.grey,
                            child: Row(
                              children: [
                                Icon(Icons.watch_later_outlined),
                                Text("3M:05")
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              BoldText(name: 'FREE', fontsize: 12),
                              Text(
                                'Rs. FREE',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: appColor,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Loading",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: appColor,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("01 "),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: appColor,
                            child: Icon(Icons.person),
                          ),
                          Text("MANASH MISHRA "),
                          Text(
                            'WINNER     ',
                            style: TextStyle(
                              backgroundColor: Colors.yellow,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("02"),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: appColor,
                            child: Icon(Icons.person),
                          ),
                          Text("MANASH MISHRA"),
                          Text(
                            'RUNNER UP',
                            style: TextStyle(
                              backgroundColor: Colors.yellow,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("03"),
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: appColor,
                            child: Icon(Icons.person),
                          ),
                          Text("MANASH MISHRA"),
                          Text(
                            'RUNNER UP',
                            style: TextStyle(
                              backgroundColor: Colors.yellow,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              )
            ],
          ),
        ),
        );

        });
  }
}
