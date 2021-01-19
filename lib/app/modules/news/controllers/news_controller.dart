import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsController extends GetxController with SingleGetTickerProviderMixin {
  //TODO: Implement NewsController
  TabController tabController;

  final count = 0.obs;

  Stream article = FirebaseFirestore.instance.collection('news').snapshots();

  @override
  void onInit() {
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
}
