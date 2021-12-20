import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ra7alah/screens/intro/intro_screen.dart';
import 'package:ra7alah/utils/services/app_routes.dart';
import 'package:ra7alah/utils/services/localization_service.dart';
import 'package:ra7alah/utils/services/storage_service.dart';

Future<void> main() async {
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Get.putAsync(() => StorageService.init(), permanent: true);
  Get.put(LocalizationService(), permanent: true);
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
          getPages: AppRoutes.routes,
          home: Intro(),
        );

  }
}
