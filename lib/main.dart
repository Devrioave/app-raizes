import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raizes/app/routes/app_pages.dart';
import 'package:raizes/app/themes/app_themes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  GetStorage.init('Raizes');

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  await dotenv.load(fileName: ".env");

  runApp(
    GetMaterialApp(
      title: 'Raizes',
      debugShowCheckedModeBanner: false,
      theme: appLightThemeData,
      getPages: AppPages.routes,
      initialRoute: '/home', // Go directly to home instead of splash
    ),
  );
}
