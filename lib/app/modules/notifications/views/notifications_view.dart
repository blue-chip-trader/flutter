import 'package:bluechip/app/modules/notifications/widgets/notification_card.dart';
import 'package:bluechip/app/modules/signals_active/controllers/signals_active_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/notifications/controllers/notifications_controller.dart';



class NotificationsView extends GetView<NotificationsController> {
  final SignalsActiveController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          NotificationCard(
          myindex: "2",
          controller: _controller,
          pair: "USDZAR",
          price: "15.1234",
          tp: "15.5432",
          sl: "16.2345",
          buy: false,
        ),
         NotificationCard(
          myindex: "2",
          controller: _controller,
          pair: "USDZAR",
          price: "15.1234",
          tp: "15.5432",
          sl: "16.2345",
          buy: true,
        ), NotificationCard(
          myindex: "2",
          controller: _controller,
          pair: "USDZAR",
          price: "15.1234",
          tp: "15.5432",
          sl: "16.2345",
          buy: true,
        ),
        ],
      )
    );
  }
}
