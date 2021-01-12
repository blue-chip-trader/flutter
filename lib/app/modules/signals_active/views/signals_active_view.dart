import 'package:bluechip/app/modules/signals_active/widgets/signal_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/signals_active/controllers/signals_active_controller.dart';
import 'package:get_storage/get_storage.dart';

class SignalsActiveView extends GetView<SignalsActiveController> {
  final SignalsActiveController controller = Get.put(SignalsActiveController());
  Stream signalsActive = FirebaseFirestore.instance
      .collection('signals')
      .doc('forex')
      .collection("signal")
      .orderBy("opened at", descending: true)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: signalsActive,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return new ListView(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              children: snapshot.data.docs
                  .where((element) => element["active"] == true)
                  .map((DocumentSnapshot document) {
                return new SignalCard(
                  myindex: document.id,
                  controller: controller,
                  pair: document.data()['pair'],
                  price: document.data()['price'],
                  tp: document.data()['tp'],
                  sl: document.data()['sl'],
                  buy: document.data()['direction'],
                  flag1: document.data()['flag1'],
                  flag2: document.data()['flag2'],
                );
              }).toList());
        });
    // GetX<SignalsActiveController>(
    //     init: Get.put(SignalsActiveController()),
    //     builder: (controller) {
    //       if (controller != null && controller.signals != null) {
    //         return ListView.builder(
    //           physics: ClampingScrollPhysics(),
    //           itemCount: controller.signals.length,
    //           itemBuilder: (_, index) {
    //             if (controller.signals[index].active) {
    //               return SignalCard(
    //                 myindex: controller.signals[index].signalId,
    //                 controller: controller,
    //                 pair: controller.signals[index].pair,
    //                 price: controller.signals[index].price,
    //                 tp: controller.signals[index].tp,
    //                 sl: controller.signals[index].sl,
    //                 buy: controller.signals[index].direction,
    //                 flag1: controller.signals[index].flag1,
    //                 flag2: controller.signals[index].flag2,
    //               );
    //             }
    //           },
    //         );
    //       } else {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //     });
  }
}
