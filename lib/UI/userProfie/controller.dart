import 'package:get/get.dart';
import 'package:quizzype001/model/UserModels/UserModel.dart';

import '../../domain/repository/repository_imports.dart';
import '../../domain/service/app/app_service_imports.dart';

class UserProfileController extends GetxController{

  var db = Get.find<DatabaseService>();
  UserModel? userModel;
  @override
  void onInit() {

    super.onInit();
    getUser();
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
}