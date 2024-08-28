import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../domain/service/app/app_service_imports.dart';
import 'approutes.dart';


class EnsureAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    try {
      var db = Get.find<DatabaseService>();
      var isAccessTokenAvailable = db.accessToken != null;
      print("Access Token Available: $isAccessTokenAvailable");

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
        print("Redirecting to Home Screen");
        return const RouteSettings(name: AppRoutes.homeScreen);
      } else {
        print("Redirecting to Profile Screen");
        return const RouteSettings(name: AppRoutes.profileScreen);
      }
    } catch (e) {
      print("Error in Middleware: $e");
      return const RouteSettings(name: AppRoutes.login);
    }
  }


}

