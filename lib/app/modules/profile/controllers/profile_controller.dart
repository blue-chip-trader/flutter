import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  FirebaseAuth auth = FirebaseAuth.instance;

  final count = 0.obs;

  @override
  void onInit() {
    if (auth.currentUser != null) {
      print("still logged in, Code: " + auth.currentUser.uid);
    }
    print("hallooooo");
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
}
