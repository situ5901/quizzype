import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../domain/service/app/app_service_imports.dart';
import 'approutes.dart';


class EnsureAuthMiddleware extends GetMiddleware {
  EnsureAuthMiddleware();

  @override
  RouteSettings? redirect(String? route) {
    var db = Get.find<DatabaseService>();

    try {
      var isAccessTokenAvailable = db.accessToken != null;

      if (isAccessTokenAvailable) {
        var user = db.user;
        print("user: $user");
        // var user ;
        if (user == null) {
          return const RouteSettings(name: AppRoutes.profileScreen);
        }

        if (user.fullname != null) {
          return const RouteSettings(name: AppRoutes.homeScreen);
        } else {
          return const RouteSettings(
            name: AppRoutes.profileScreen,
          );
        }
      } else {
        return const RouteSettings(name: AppRoutes.login);
      }
    } catch (e) {
      return const RouteSettings(name: AppRoutes.login);
    }
  }
}
