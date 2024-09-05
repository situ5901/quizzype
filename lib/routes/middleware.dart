import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../domain/service/app/app_service_imports.dart';
import 'approutes.dart';

class EnsureAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    try {
      var db = Get.find<DatabaseService>();
      var islogin = db.isLogin;
      var isAccessTokenAvailable = db.accessToken != null;
      print("Access Token Available: $isAccessTokenAvailable");

      if(islogin == true){
        if (!isAccessTokenAvailable) {
          print("Redirecting to Login: Access token not available");
          return const RouteSettings(name: AppRoutes.login);
        }

        var user = db.user;
        print("User Data: ${user?.fullname}");

        if (user == null) {
          print("Redirecting to Login: User is null");
          return const RouteSettings(name: AppRoutes.login);
        }

        if (user.fullname != null && user.fullname!.isNotEmpty) {
          // To avoid getting stuck on OTP or other screens, ensure this redirect
          // only happens once or adjust the state.
          if (route == AppRoutes.homeScreen) {
            print("Already on Home Screen");
            return null; // No redirect needed
          }

          print("Redirecting to Home Screen");
          return const RouteSettings(name: AppRoutes.homeScreen);
        } else {
          // Avoid redirect loops by ensuring this condition isn't triggered
          // once on the profile screen.
          if (route == AppRoutes.profileScreen) {
            print("Already on Profile Screen");
            return null; // No redirect needed
          }

          print("Redirecting to Profile Screen");
          return const RouteSettings(name: AppRoutes.profileScreen);
        }else{
        return const RouteSettings(name: AppRoutes.login);
      }
    } catch (e) {
      print("Error in Middleware: $e");
      return const RouteSettings(name: AppRoutes.login);
    }
  }
}
