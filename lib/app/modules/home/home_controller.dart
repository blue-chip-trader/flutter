import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  FirebaseAuth auth = FirebaseAuth.instance;
  final count = 0.obs;

  @override
  void onInit() async {
    if (auth.currentUser != null) {
      print("still logged in, Code: "+auth.currentUser.uid);
    }
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;
}
