import 'package:bluechip/app/modules/auth/bindings/auth_binding.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/root.dart';
import 'package:flamingo/flamingo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Flamingo.initializeApp();
  await GetStorage.init();
  await FirebaseMessaging.instance.subscribeToTopic("signal");

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    systemNavigationBarDividerColor: Colors.blue, // status bar color
  ));

  final appData = GetStorage();

  appData.writeIfNull("_isDark", true);

  bool _isDarkMode = appData.read("_isDark");

  // RemoteMessage initialMessage =
  //     await FirebaseMessaging.instance.getInitialMessage();

  // // If the message also contains a data property with a "type" of "chat",
  // // navigate to a chat screen
  // if (initialMessage?.data['type'] == 'chat') {
  //   Get.toNamed('/notifications');
  // }

  // // Also handle any interaction when the app is in the background via a
  // // Stream listener
  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //   if (message.data['type'] == 'chat') {
  //     Get.toNamed('/notifications');
  //   }
  // });

  runApp(
    GetMaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRight,
      title: "Blue Chip Trader",
      onInit: () {},
      initialBinding: AuthBinding(),
      home: Root(),
      getPages: AppPages.routes,
    ),
  );
}
