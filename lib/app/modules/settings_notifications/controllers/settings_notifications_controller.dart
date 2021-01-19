import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingsNotificationsController extends GetxController {
  //TODO: Implement SettingsNotificationsController
  String uid = FirebaseAuth.instance.currentUser.uid.toString();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final count = 0.obs;

  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
}
