import 'package:bluechip/app/modules/signals_active/controllers/signals_active_controller.dart';
import 'package:bluechip/app/modules/signals_active/widgets/signal_card.dart';
import 'package:bluechip/app/modules/signals_history/widgets/closed_signal_card.dart';
import 'package:bluechip/app/presentation/blue_chip_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/signals_history/controllers/signals_history_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class SignalsHistoryView extends GetView<SignalsHistoryController> {
  final SignalsActiveController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetX<SignalsActiveController>(
        init: Get.put(SignalsActiveController()),
        builder: (controller) {
          if (controller != null && controller.signals != null) {
            return ListView.builder(
              itemCount: _controller.signals.length,
              itemBuilder: (_, index) {
                if (_controller.signals[index].active) {
                  return ClosedSignalCard(
                    myindex: _controller.signals[index].signalId,
                    controller: _controller,
                    pair: _controller.signals[index].pair,
                    price: _controller.signals[index].price,
                    tp: _controller.signals[index].tp,
                    sl: _controller.signals[index].sl,
                    won: _controller.signals[index].direction,
                    date: "25 Nov 2020 10:10",
                  );
                }
              },
            );
          } else {
            return Text("Loading...");
          }
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
