import 'package:get/get.dart';
import 'package:quizzype001/UI/HomeScreen/controller.dart';
import 'package:quizzype001/routes/approutes.dart';

import '../../domain/repository/repository_imports.dart';

class GkContestController extends GetxController {
  final repository = UserRepository();
  String balance = "0"; // Initialize with "0"
  int? amount;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  void load() async {
    await getBalance();
  }

  Future<void> getBalance() async {
    try {
      balance = await repository.getWalletBalance() ;
      print("Balance: $balance");
      update();  // Notify listeners of the updated balance
    } catch (e) {
      print("Error fetching balance: $e");
    }
  }



}
