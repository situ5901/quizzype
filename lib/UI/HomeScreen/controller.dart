import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quizzype001/domain/service/app/app_service_imports.dart';
import 'package:quizzype001/model/UserModels/UserModel.dart';

import 'package:get/get.dart';

import '../../domain/repository/repository_imports.dart';

class HomeController extends GetxController {
  var db = Get.find<DatabaseService>(); // Finding the DatabaseService
  UserModel? userModel; // This will store the user data
  final repository = UserRepository();
  String balance = "0";

  @override
  void onInit() {
    super.onInit();
    update();
    load();
    getUser(); // Fetch the user data when the controller is initialized
  }

  void load(){
    getBalance();
    update();
  }
  void getUser() {
    // Assuming that `db.user` returns a UserModel object
    userModel = db.user;

    // You can also check if the userModel is not null and then perform further actions
    if (userModel != null) {
      print("User data fetched successfully: ${userModel!.fullname}");
      // Perform other actions with userModel if necessary
    } else {
      print("User data is null");
    }
  }

  Future<void> getBalance() async {
    try {

      balance = await repository.getWalletBalance();
      print("balnace : $balance");
    } catch (e) {
      print("Error fetching contestId: $e");

    }
  }
}
