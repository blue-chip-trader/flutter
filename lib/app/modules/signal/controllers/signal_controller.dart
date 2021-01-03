import 'package:bluechip/app/models/onesignal.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SignalController extends GetxController {
  //TODO: Implement SignalController
  String id;

  Rx<OneSignalModel> _sigModel = OneSignalModel().obs;

  OneSignalModel get sig => _sigModel.value;

  set sig(OneSignalModel value) => this._sigModel.value = value;

  final count = 0.obs;

  getSignal(String id) async {
    try {
      DocumentSnapshot _doc = await FirebaseFirestore.instance
          .collection("signals")
          .doc("forex")
          .collection("signal")
          .doc(id)
          .get();

      return _doc;
    } catch (e) {
      print(e);
      rethrow;
    }

    @override
    void onInit() {}

    @override
    void onReady() {}

    @override
    void onClose() {}

    void increment() => count.value++;
  }
}
