import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:quizzype001/UI/Contest_Details.dart';
import 'package:quizzype001/UI/Daily.dart';
import 'package:quizzype001/UI/DailyContest.dart';
import 'package:quizzype001/UI/GK%20Quiz/GK_QUIZ.dart';
import 'package:quizzype001/UI/HomeScreen/Home.dart';
import 'package:quizzype001/UI/MegaContest.dart';
import 'package:quizzype001/UI/userProfie/userProfile.dart';

import '../UI/Auth/login/Login.dart';
import '../UI/Auth/otp/Otp.dart';
import '../UI/HomeScreen/Home.dart';
import '../UI/LeaderBoard/Leaderboard.dart';
import '../UI/Navbar.dart';
import '../UI/Profile/Profile.dart';
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



  static  get routes => [
    GetPage(name: login, page: () =>  Login_Page()),
    GetPage(name: verify, page: () =>   Otp()),
    GetPage(name: homeScreen,middlewares: [EnsureAuthMiddleware()], page: () =>   Navbar()),
    GetPage(name: profileScreen, page: () =>  const ProfilePage()),
    GetPage(name: userScreen, page: () =>   UserProfile()),
    GetPage(name: gK_Question, page: () =>   GK_QUIZ()),
    GetPage(name: leaderBoard, page: () =>   Leaderboard()),
    GetPage(name: megaContest, page: () =>   MegaContest()),
    GetPage(name: daily, page: () =>   Daily()),
    GetPage(name: contestDetails, page: () =>   ContestDetails()),
    GetPage(name: dailyContest, page: () =>   DailyContest()),

  ];
}