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

      if (islogin == true) {
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
          if (route == AppRoutes.homeScreen) {
            print("Already on Home Screen");
            return null; // No redirect needed
          }

          print("Redirecting to Home Screen");
          return const RouteSettings(name: AppRoutes.homeScreen);
        } else {
          if (route == AppRoutes.profileScreen) {
            print("Already on Profile Screen");
            return null; // No redirect needed
          }
          print("Redirecting to Profile Screen");
          return const RouteSettings(name: AppRoutes.profileScreen);
        }
      } else {
        // If not logged in, redirect to login
        print("Redirecting to Login: User not logged in");
        return const RouteSettings(name: AppRoutes.login);
      }
    } catch (e) {
      print("Error in Middleware: $e");
      return const RouteSettings(name: AppRoutes.login);
    }
  }
}


