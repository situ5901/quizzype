import 'package:get/get.dart';
import 'package:quizzype001/routes/approutes.dart';

import '../../domain/repository/repository_imports.dart';
import 'Add_CASH.dart';


class AddCashController extends GetxController {
  final repository = UserRepository();
  String? balance = "0";
  int? amount;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  void load() async {
    await getBalance();
    update();
  }

  Future<void> getBalance() async {
    try {
      balance = await repository.getWalletBalance();
      print("Balance: $balance");
      update();  // Notify listeners of the updated balance
    } catch (e) {
      print("Error fetching balance: $e");
    }
  }

  Future<void> addCashAndCreateContest(int enteredAmount) async {
    try {
      if (balance == null) {
        print('Balance not loaded');
        return;
      }

      final currentBalance = int.tryParse(balance!) ?? 0;

      if (enteredAmount > currentBalance) {
        Get.snackbar('Insufficient Balance', 'Your balance is too low to add this amount');
        return;
      }

      // Show success dialog
      Get.dialog(CustomDialog(onJoinNow: () async {
        await repository.createContestId(enteredAmount);
        Get.back();// Close the dialog
        Get.toNamed(AppRoutes.gK_Question);
      },));
      // Reload balance after successful transaction
      await getBalance();
    } catch (e) {
      print("Error adding cash or creating contest: $e");
    }
  }

}
