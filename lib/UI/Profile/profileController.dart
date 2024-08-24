import 'package:get/get.dart';
import 'package:quizzype001/model/UserModels/StudentModel.dart';
import 'package:quizzype001/model/UserModels/UserModel.dart';

import '../../App routes/approutes.dart';
import '../../domain/repository/repository_imports.dart';
import '../../domain/service/app/app_service_imports.dart';
import '../widgets/Toast/toast.dart';

class ProfileController extends GetxController {
  final repository = UserRepository();
  var selectEducation;
      var fullname;
      var address;
      var phoneNumber;
      var schoolName;
      var schoolAddress;
      var boardOption;
      var classvalue;
      var mediumName;
      var aadharcard;
  UserDetails? userDetails;
  String? token;
  final DatabaseService databaseService = Get.find<DatabaseService>();


  @override
  void onInit() {
    super.onInit();
    token = databaseService.accessToken; // Retrieve the token using the getter method
    print("Retrieved token: $token"); // Print the token to the console
  }

  Future<void> postStudentDetails() async {
    if (token != null) {
      await repository.postStudentDetails( token: token!,
          selectEducation: selectEducation,
          fullname: fullname,
          address: address,
          phoneNumber: phoneNumber,
          schoolName: schoolName,
          schoolAddress: schoolAddress,
          boardOption: boardOption,
          classvalue: classvalue,
          mediumName: mediumName,
          aadharcard: aadharcard);
      Get.offAllNamed(AppRoutes.homeScreen);
    } else {
      showToast(message: 'Token not available');
    }
  }

  Future<void> postUserDetails() async {
    if (token != null) {
      await repository.postUserDetails(userDetails!, token!);
    } else {
      showToast(message: 'Token not available');
    }
  }
}
