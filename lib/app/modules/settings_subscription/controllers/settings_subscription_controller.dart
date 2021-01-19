import 'package:flutter/services.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsSubscriptionController extends GetxController {
  //TODO: Implement SettingsSubscriptionController

  String uid = FirebaseAuth.instance.currentUser.uid.toString();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final count = 0.obs;
  List<IAPItem> _iaps = [];
  _initIAPs() async {
    var result = await FlutterInappPurchase.instance.initConnection;
    print("Established IAP Connection..." + result);
    _iaps = await FlutterInappPurchase.instance
        .getSubscriptions(["starter", "pro", "pro_plus"]);
    for (var i = 0; i < _iaps.length; ++i) {
      print(_iaps[i].title + " " + _iaps[i].price + " " + _iaps[i].productId);
    }
  }

  PurchasedItem _purchasedItem;

  var selection = 0.obs;

  String plan;

  getSelection() {
    if (selection.value == 1) {
      plan = "Starter";
    } else if (selection.value == 2) {
      plan = "Pro";
    } else if (selection.value == 3) {
      plan = "Pro Plus";
    }
    return plan;
  }

  getSubscrption() {
    return selection.value;
  }

  purchaseIAP() async {
    try {
      if (getSelection() == "Starter") {
        _purchasedItem =
            await FlutterInappPurchase.instance.requestPurchase("starter");
      } else if (getSelection() == "Pro") {
        _purchasedItem =
            await FlutterInappPurchase.instance.requestPurchase("pro");
      } else if (getSelection() == "Pro Plus") {
        _purchasedItem =
            await FlutterInappPurchase.instance.requestPurchase("pro_plus");
      }
      if (_purchasedItem.purchaseStateAndroid == PurchaseState.purchased) {
        Get.snackbar("title", _purchasedItem.productId);
      }
    } catch (e) {
      PlatformException p = e as PlatformException;
      print(p.code);
      print(p.message);
      print(p.details);
    }
  }

//   PurchasedItem _purchasedItem;
// _purchaseIAP() async {
//    try {
//        _purchasedItem = await FlutterInappPurchase.instance.buySubscription(_selectedIAP.productId);
// } catch (e) {
//       PlatformException p = e as PlatformException;
//       print(p.code);
//       print(p.message);
//       print(p.details);
// }

  @override
  void onInit() {
    _initIAPs();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
}
