import 'package:get/get.dart';
import 'package:quizzype001/domain/service/app/app_service_imports.dart';
import 'package:quizzype001/model/UserModels/UserModel.dart';
import '../../domain/repository/repository_imports.dart';

class HomeController extends GetxController {
  var db = Get.find<DatabaseService>(); // Finding the DatabaseService
  UserModel? userModel; // This will store the user data
  final repository = UserRepository();
  String balance = "0"; // Default balance as string

  @override
  void onInit() {
    super.onInit();
    getUser();  // Fetch the user data when the controller is initialized
    update();
    load();     // Fetch balance
  }

  void load() {
    getBalance();
    update();
  }
  @override
  void onReady() {
    super.onReady();
    load();
    update();
  }

  void getUser() {
    userModel = db.user;

    if (userModel != null) {
      print("User data fetched successfully: ${userModel!.fullname}");
    } else {
      print("User data is null");
    }
  }

  Future<void> getBalance() async {
    try {
      balance = await repository.getWalletBalance() ?? "0"; // Ensuring balance is not null
      print("Balance fetched: $balance");
      update();  // Update the UI after the balance is fetched
    } catch (e) {
      print("Error fetching balance: $e");
    }
  }
}
