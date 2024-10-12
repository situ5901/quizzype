import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:quizzype001/UI/Addcash/Add_CASH.dart';
import 'package:quizzype001/UI/Contest_Details.dart';
import 'package:quizzype001/UI/Daily.dart';
import 'package:quizzype001/UI/DailyContest.dart';
import 'package:quizzype001/UI/GK%20Quiz/GK_QUIZ.dart';
import 'package:quizzype001/UI/HomeScreen/Home.dart';
import 'package:quizzype001/UI/MegaContest.dart';
import 'package:quizzype001/UI/userProfie/userProfile.dart';

import '../UI/Auth/login/Login.dart';
import '../UI/Auth/otp/Otp.dart';
import '../UI/Collage_Student/ColllageQuest.dart';
import '../UI/GK Quiz/ShowScore.dart';
import '../UI/HomeScreen/Home.dart';
import '../UI/LeaderBoard/Leaderboard.dart';
import '../UI/Navbar.dart';
import '../UI/Profile/Profile.dart';
import '../UI/classcontest/classQuest.dart';
import '../UI/competitive/CompQuest.dart';
import '../UI/practisescreens/PracticeContest.dart';
import 'middleware.dart';


class AppRoutes{
  static const splash = '/splash';
  static const login = '/Login';
  static const verify = '/Otp';
  static const homeScreen = '/Home';
  static const profileScreen = '/Profile';
  static const userScreen = '/UserProfile';
  static const gK_Question = '/GK_QUIZ';
  static const leaderBoard = '/leaderboard';
  static const megaContest = '/MegaContest';
  static const daily = '/Daily';
  static const contestDetails = '/Contest_details';
  static const dailyContest = '/DailyContest';
  static const PracticeContest = '/PracticeCont';
  static const addCash = '/Add_Cash';
  static const showscore = '/ShowScore.dart';
  static const classContest = '/classQuest.dart';
  static const collageQuest = '/CollageQuest.dart';
  static const compQuest = '/CompQuest.dart';



  static  get routes => [
    GetPage(name: login, page: () =>  Login_Page()),
    GetPage(name: verify, page: () =>   Otp()),
    GetPage(name: homeScreen,middlewares: [EnsureAuthMiddleware()], page: () =>   Navbar()),
    GetPage(name: profileScreen, page: () =>  const ProfilePage()),
    GetPage(name: userScreen, page: () =>   UserProfile()),
    GetPage(name: gK_Question, page: () =>   GK_QUIZ()),
    GetPage(name: leaderBoard, page: () =>   Leaderboard()),
    GetPage(name: megaContest, page: () =>   MEGACONTEST()),
    GetPage(name: daily, page: () =>   Daily()),
    GetPage(name: contestDetails, page: () =>   ContestDetails()),
    GetPage(name: dailyContest, page: () =>   DailyContest()),
    GetPage(name: addCash, page: () =>   ADD_CASh()),
    GetPage(name: showscore, page: () =>   Showscore()),
    GetPage(name: PracticeContest, page: () =>   practiceContest()),
    GetPage(name: classContest, page: () =>   ClassContest()),
    GetPage(name: collageQuest, page: () =>   CollageQuest()),
    GetPage(name: compQuest, page: () =>   Compquest()),

  ];
}