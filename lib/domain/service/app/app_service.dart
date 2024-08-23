part of 'app_service_imports.dart';


class AppService extends GetxService {
  Future<AppService> init() async {
    await initiateServices();
    return this;
  }

  Future<void> initiateServices() async {
    await Future.wait([
     Get.putAsync(() => DatabaseService().init()),
     Get.putAsync(() => MessagingService().init())
    ]);

    await Get.putAsync(() => ApiService().init());



     await initializeApiServices(Get.find<ApiService>());
     await initializeRepositories();

  }

  Future<void> initializeApiServices(ApiService apiService) async{

    /// Initialize and put the FileAPI
    // Get.put( FileAPI(dio: apiService.dio, externalDio: apiService.externalDio));

    /// Initialize and put the AuthApi
    Get.put( AuthApi(apiService.dio));
//
//    /// Initialize and put the SearchApi
//    Get.put( SearchApi(apiService.dio));
//
//    /// Initialize and put the UserApi
     Get.put( UserApi(apiService.dio));
//
//    /// Initialize and put the NotificationAPI
//    Get.put( NotificationAPI(apiService.dio));
//
//    /// Initialize and put the HousingApi
//    Get.put( HousingApi(apiService.dio));
//
//    /// Initialize and put the diningApi
//    Get.put( DiningApi(apiService.dio));


  }
}
