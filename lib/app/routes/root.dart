import 'package:bluechip/app/modules/auth/controllers/auth_controller.dart';
import 'package:bluechip/app/modules/auth/views/auth_view.dart';
import 'package:bluechip/app/modules/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.put(AuthController());
    
    return GetX(
      initState: (_) async {
        Get.put<AuthController>(AuthController());
      },
      builder: (_) {
        if (auth.isLogged.value == true) {
          return HomeView();
        } else {
          return AuthView();
        }
      },
    );
  }
}
