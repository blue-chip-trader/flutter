import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  //TODO: Implement SettingsTermsController

  Future getData(String collection) async {
    QuerySnapshot snapShot =
        await FirebaseFirestore.instance.collection(collection).get();
    return snapShot;
  }

  final count = 0.obs;

  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
}
