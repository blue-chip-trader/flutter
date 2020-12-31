import 'package:bluechip/app/modules/auth/bindings/auth_binding.dart';
import 'package:bluechip/app/modules/auth/controllers/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/root.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  AuthController _authController = Get.put(AuthController());

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final appData = GetStorage();

  appData.writeIfNull("_isDark", true);

  bool _isDarkMode = appData.read("_isDark");

  // If the message also contains a data property with a "type" of "chat",
  // navigate to a chat screen

  // Also handle any interaction when the app is in the background via a
  // Stream listener

  runApp(
    GetMaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title: "Blue Chip Trader",
      initialBinding: AuthBinding(),
      home: Root(),
      getPages: AppPages.routes,
    ),
  );
}
