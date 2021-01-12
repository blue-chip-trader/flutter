import 'package:bluechip/app/modules/auth/bindings/auth_binding.dart';
import 'package:bluechip/app/modules/auth/controllers/auth_controller.dart';
import 'package:bluechip/app/modules/auth/views/auth_view.dart';
import 'package:bluechip/app/modules/confirmdetails/views/confirmdetails_view.dart';
import 'package:bluechip/app/modules/signals_active/views/signals_active_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/modules/home/home_view.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/root.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    systemNavigationBarDividerColor: Colors.blue, // status bar color
  ));

  final appData = GetStorage();

  appData.writeIfNull("_isDark", true);

  bool _isDarkMode = appData.read("_isDark");

  runApp(
    GetMaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRight,
      title: "Blue Chip Trader",
      initialBinding: AuthBinding(),
      home: Root(),
      getPages: AppPages.routes,
      
    ),
  );
}
