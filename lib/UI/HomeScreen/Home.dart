import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quizzype001/Common/BoldText.dart';
import 'package:quizzype001/UI/DailyContest.dart';
import 'package:quizzype001/UI/Gk_contest/GK_Contest.dart';
import 'package:quizzype001/UI/HomeScreen/controller.dart';
import 'package:quizzype001/UI/Main_Page.dart';
import 'package:quizzype001/UI/MegaContest.dart';
import 'package:quizzype001/UI/Monthly.dart';
import 'package:quizzype001/UI/SideBar.dart';
import 'package:quizzype001/domain/repository/repository_imports.dart';
import 'package:quizzype001/domain/service/app/app_service_imports.dart';
import '../../Common/Colors.dart';
import '../../routes/approutes.dart';
import '../practisescreens/PracticeContest.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<String> imagePaths = [
    "Assets/Images/1.jpeg",
    "Assets/Images/Week.jpg",
    "Assets/Images/Monthly.jpg",
    "Assets/Images/Mega.jpg",
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
        builder: (controller) {
          return Scaffold(
            drawer: SideBar(),
            appBar: AppBar(
              backgroundColor: Colors.blue.shade900,
              centerTitle: true,
              title: Text(
                "GO QUIZZY",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontStyle: FontStyle.italic, // Change font style to italic
                  fontWeight: FontWeight.bold, // Bold text
                ),
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
                        "₹${controller.balance}",
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
                    Get.toNamed(AppRoutes.addCash);
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
            body: Container(
              color: Colors.white30, // Change body background color
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.blue.shade900, Colors.white],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              height: 200,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Play Game and Earn Money!",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
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
                                  ],
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
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      BoldText(
                                        name: "PLAY QUIZZY",
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
                                        color: Colors.blue.shade900,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 8),
                                  Image.asset(
                                    'Assets/Images/img_1.png',
                                    height: 40,
                                  ),
                                  SizedBox(width: 8),
                                  Image.asset(
                                    'Assets/Images/img.png',
                                    height: 40,
                                  ),
                                ],
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
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
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 410,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                            MediaQuery.of(context).orientation ==
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
                              onTap: () async {
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
                                          builder: (context) => DailyContest()),
                                    );
                                    break;
                                  case 2:
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Monthly()),
                                    );
                                    break;
                                  case 3:
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MEGACONTEST()),
                                    );
                                    break;
                                  case 4:
                                    var id = await UserRepository()
                                        .createContestId();
                                    print("Container pressed!");
                                    Get.toNamed(AppRoutes.PracticeContest,
                                        arguments: id.toString());
                                    break;
                                  default:
                                    break;
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    image: AssetImage(imagePaths[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        var id = await UserRepository().createContestId();
                        print("Container pressed!");
                        Get.toNamed(AppRoutes.PracticeContest,
                            arguments: id.toString());
                      },
                      child: Container(
                        height: 60,
                        margin: EdgeInsets.all(10),
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                "Practice contest",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      child: Card(
                        color: Colors.blue.shade900,
                        elevation: 4,
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Lord V.K School Contest',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Play Contest',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Time 60s',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child:Lottie.asset('Assets/Images/school.json',
                                  height: 250, // set the height
                                  width: 250,  // set the width
                                  fit: BoxFit.fill, ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
