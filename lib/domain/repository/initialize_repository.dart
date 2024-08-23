
import 'package:get/get.dart';
import 'package:quizzype001/domain/repository/repository_imports.dart';

Future<void> initializeRepositories() async {
  try{

    // Get.put(FileRepository());
    Get.put(AuthRepository());
    // Get.put(DiningRepository());
    // Get.put(DiningReviewRepository());
    // Get.put(CreateFlatRepository());
    // Get.put(HousingRepository());
    // Get.put(SearchRepository());
    // Get.put(UserRepository());
    // Get.put(NotificationRepository());

    print('repository initialize');

  }catch(e){}
}