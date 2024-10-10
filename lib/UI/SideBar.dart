import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../domain/repository/repository_imports.dart';
import '../domain/service/app/app_service_imports.dart';
import '../routes/approutes.dart';

class SideBar extends StatelessWidget {
   SideBar({super.key});
  final DatabaseService databaseService = Get.find<DatabaseService>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(databaseService.user!.fullname ?? "user"),
              accountEmail: Text(databaseService.user!.email ?? "email"),
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
                Get.toNamed(AppRoutes.leaderBoard);
              },
              leading: Icon(Icons.score),
              title: Text("Score"),
            ),
            ListTile(
              onTap: (){
                Get.toNamed(AppRoutes.dailyContest);
              },
              leading: Icon(Icons.score),
              title: Text("Daily Contest"),
            ),
            ListTile(
              onTap: (){
                Get.toNamed(AppRoutes.megaContest);
              },
              leading: Icon(Icons.score),
              title: Text("Mega Contest"),
            ),
            ListTile(
              onTap: (){
                Get.toNamed(AppRoutes.leaderBoard);
              },
              leading: Icon(Icons.score),
              title: Text("Practice Contest"),
            ),
            ListTile(
              onTap: (){
                Get.toNamed(AppRoutes.leaderBoard);
              },
              leading: Icon(Icons.score),
              title: Text("Monthely Contest"),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notification"),
            ),
            ListTile(
              onTap: (){
                UserRepository().getContestDetail("6700feb966df418db40511de");
              },
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
    );
  }
}
