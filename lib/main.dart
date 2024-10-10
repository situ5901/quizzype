import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzype001/routes/approutes.dart';
import 'package:quizzype001/routes/navigator_service.dart';
import 'domain/service/app/app_service_imports.dart';
import 'localization/app_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await Get.putAsync(() => AppService().init());
  runApp(const MyApp());
}
class TempContext {
  static late BuildContext context;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addObserver(lifecycleObserver);
    TempContext.context = context;
    return GetMaterialApp(
      title: 'Campus Admin',
      navigatorKey: NavigatorService.navigatorKey,
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: AppRoutes.homeScreen,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
