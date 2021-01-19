import 'package:bluechip/app/modules/signals_active/controllers/signals_active_controller.dart';
import 'package:bluechip/app/modules/signals_history/widgets/closed_signal_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/signals_history/controllers/signals_history_controller.dart';
import 'package:intl/intl.dart';

class SignalsHistoryView extends GetView<SignalsHistoryController> {
  final SignalsActiveController _controller = Get.find();
  Stream signalsHistory = FirebaseFirestore.instance
      .collection('signals')
      .doc('forex')
      .collection("signal")
      .orderBy("closed at", descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: signalsHistory,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Center(child: CircularProgressIndicator()),
            );
          }

          return new ListView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: snapshot.data.docs
                  .where((element) => element["active"] == false)
                  .map((DocumentSnapshot document) {
                return new ClosedSignalCard(
                  myindex: document.id,
                  sid: document.data()['sid'],
                  controller: _controller,
                  pair: document.data()['pair'],
                  price: document.data()['price'],
                  tp: document.data()['p/l'],
                  sl: document.data()['sl'],
                  won: document.data()['won'],
                  date: DateFormat.yMMMd()
                      .add_jm()
                      .format(document.data()['closed at'].toDate()),
                );
              }).toList());
        });

    // return ListView(
    //   children: [
    //     ClosedSignalCard(
    //       myindex: _controller.signals[index].signalId,
    //       controller: _controller,
    //       pair: "USDZAR",
    //       price: "15.1234",
    //       tp: "200 points",
    //       sl: "16.2345",
    //       won: true,
    //       date: "01-04-2020 13:33",
    //     )
    //   ],
    // );
  }
}

// GetX<SignalsActiveController>(
//         init: Get.put(SignalsActiveController()),
//         builder: (controller) {
//           if (controller != null && controller.signals != null) {
//             return ListView.builder(
//               itemCount: _controller.signals.length,
//               itemBuilder: (_, index) {
//                 if (!_controller.signals[index].active) {
//                   return ClosedSignalCard(
//                     myindex: _controller.signals[index].signalId,
//                     controller: _controller,
//                     pair: _controller.signals[index].pair,
//                     price: _controller.signals[index].price,
//                     tp: _controller.signals[index].tp,
//                     sl: _controller.signals[index].sl,
//                     won: _controller.signals[index].direction,
//                     date: "25 Nov 2020 10:10",
//                   );
//                 }
//               },
//             );
//           } else {
//             return Text("Loading...");
//           }
//         });
