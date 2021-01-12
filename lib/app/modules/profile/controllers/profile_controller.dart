import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
    CollectionReference users = FirebaseFirestore.instance.collection('users');

  final count = 0.obs;

  getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await users.doc(uid).get();

      return _doc;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  

  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
}
