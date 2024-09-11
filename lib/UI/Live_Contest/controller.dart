import 'package:get/get.dart';
import 'package:quizzype001/domain/service/app/app_service_imports.dart';
import 'package:quizzype001/model/UserModels/UserModel.dart';
import '../../domain/repository/repository_imports.dart';

class LiveController extends GetxController {
  var db = Get.find<DatabaseService>(); // Finding the DatabaseService
final repository = UserRepository();
  String balance = "0"; // Default balance as string

  @override
  void onInit() {
    super.onInit();
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
