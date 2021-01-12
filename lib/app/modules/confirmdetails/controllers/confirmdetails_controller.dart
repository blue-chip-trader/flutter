import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmdetailsController extends GetxController {
  //TODO: Implement ConfirmdetailsController
  User user = FirebaseAuth.instance.currentUser;
  final dname = "Display Name".obs;
  final email = "username@email.com".obs;

  setName(String bcname) {
    dname(bcname);
  }

  setEmail(String bcemail) {
    email(bcemail);
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final count = 0.obs;
  // Future<void> addUser(dname, phone, email) {
  //   // Call the user's CollectionReference to add a new user

  //   return users
  //       .doc(user.uid)
  //       .set({
  //         'dname': dname, // John Doe
  //         'phone': phone, // Stokes and Sons
  //         'email': email // 42
  //       })
  //       .then((value) => print("User Updated"))
  //       .catchError((error) => print("Failed to add user: $error"));
  // }

  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
}
