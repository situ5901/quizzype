import 'package:get/get.dart';

import '../../domain/repository/repository_imports.dart';
import '../../domain/service/app/app_service_imports.dart';
import '../../routes/approutes.dart';
import '../widgets/Toast/toast.dart';

class ProfileController extends GetxController {
  final repository = UserRepository();
  late String selectEducation;
  late String fullname;
  late String address;
  late String phoneNumber;
  late String phoneNumber1;
  late String schoolName;
  late String schoolAddress;
  late String boardOption;
  late String classvalue;
  late String mediumName;
  late String aadharcard;
  late String email;
  late String city;
  late String state;
  late String dob;
  late String pincode;

  String? token;
  final DatabaseService databaseService = Get.find<DatabaseService>();

  @override
  void onInit() {
    super.onInit();
    token = databaseService
        .accessToken; // Retrieve the token using the getter method
    print("Retrieved token: $token"); // Print the token to the console
  }

  Future<void> postStudentDetails() async {
    if (token != null) {
      await repository.postStudentDetails(
          token: token!,
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
      await repository.postUserDetails(
        token: token!,
        fullname: fullname,
        address: address,
        phoneNumber: phoneNumber1,
        email: email,
        city: city,
        state: state,
        pincode: pincode,
        dob: dob,
      );

      Get.offAllNamed(AppRoutes.homeScreen);
    } else {
      showToast(message: 'Token not available');
    }
  }
}
