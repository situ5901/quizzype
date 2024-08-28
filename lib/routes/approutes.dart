import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:quizzype001/UI/Home.dart';

import '../UI/Auth/login/Login.dart';
import '../UI/Auth/otp/Otp.dart';
import '../UI/Home.dart';
import '../UI/Profile/Profile.dart';
import 'middleware.dart';


class AppRoutes{
  static const splash = '/splash';
  static const login = '/Login';
  static const verify = '/Otp';
  static const homeScreen = '/Home';
  static const profileScreen = '/Profile';


  static  get routes => [
    GetPage(name: login, page: () =>  Login_Page()),
    GetPage(name: verify, page: () =>   Otp()),
    GetPage(name: homeScreen,middlewares: [EnsureAuthMiddleware()], page: () =>  const Home()),
    GetPage(name: profileScreen, page: () =>   ProfilePage()),

  ];
}