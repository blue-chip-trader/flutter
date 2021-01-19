import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {
  //TODO: Implement ExploreController

  final count = 0.obs;
  int length;

  Stream<List> getmyPost() {
    return FirebaseFirestore.instance
        .collection("posts")
        .snapshots()
        .map((QuerySnapshot query) {
      List retVal = List();
      query.docs.forEach((element) {
        retVal.add(element);
      });
      return retVal.toList();
    });
  }

  final List<Color> colors = <Color>[
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.yellow
  ];
  Stream posts = FirebaseFirestore.instance
      .collection("posts")
      .orderBy("created", descending: true)
      .snapshots();

  final List<String> pics = <String>[
    'https://images.unsplash.com/photo-1551636898-47668aa61de2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80',
    'https://images.unsplash.com/photo-1522120691812-dcdfb625f397?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1528716321680-815a8cdb8cbe?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=710&q=80',
    'https://images.unsplash.com/photo-1522688306378-fbb315c6ba9a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80',
    'https://images.unsplash.com/photo-1534196511436-921a4e99f297?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
  ];

  List<String> myList = <String>[
    'one',
    'two',
    'three',
    'four',
    'five',
  ];

  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
}
