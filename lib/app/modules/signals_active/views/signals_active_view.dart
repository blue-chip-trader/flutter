import 'package:bluechip/app/modules/signals_active/widgets/signal_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/signals_active/controllers/signals_active_controller.dart';
import 'package:get_storage/get_storage.dart';

class SignalsActiveView extends GetView<SignalsActiveController> {
  final SignalsActiveController controller = Get.put(SignalsActiveController());

  @override
  Widget build(BuildContext context) {
    return GetX<SignalsActiveController>(
        init: Get.put(SignalsActiveController()),
        builder: (controller) {
          if (controller != null && controller.signals != null) {
            return ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: controller.signals.length,
              itemBuilder: (_, index) {
                if (controller.signals[index].active) {
                  return SignalCard(
                    myindex: controller.signals[index].signalId,
                    controller: controller,
                    pair: controller.signals[index].pair,
                    price: controller.signals[index].price,
                    tp: controller.signals[index].tp,
                    sl: controller.signals[index].sl,
                    buy: controller.signals[index].direction,
                    flag1: controller.signals[index].flag1,
                    flag2: controller.signals[index].flag2,
                  );
                }
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });

    // return ListView(
    //   children: [
    //     SignalCard(
    //       myindex: "1",
    //       controller: controller,
    //       pair: "USDZAR",
    //       price: "15.1234",
    //       tp: "15.5432",
    //       sl: "16.2345",
    //       buy: true,
    //     ),
    //     SignalCard(
    //       myindex: "2",
    //       controller: controller,
    //       pair: "USDZAR",
    //       price: "15.1234",
    //       tp: "15.5432",
    //       sl: "16.2345",
    //       buy: false,
    //     ),
    //     SignalCard(
    //       myindex: "3",
    //       controller: controller,
    //       pair: "USDZAR",
    //       price: "15.1234",
    //       tp: "15.5432",
    //       sl: "16.2345",
    //       buy: true,
    //     ),
    //     SignalCard(
    //       myindex: "4",
    //       controller: controller,
    //       pair: "USDZAR",
    //       price: "15.1234",
    //       tp: "15.5432",
    //       sl: "16.2345",
    //       buy: true,
    //     ),
    //     SignalCard(
    //       myindex: "5",
    //       controller: controller,
    //       pair: "USDZAR",
    //       price: "15.1234",
    //       tp: "15.5432",
    //       sl: "16.2345",
    //       buy: false,
    //     )
    //   ],
    // );
  }
}
