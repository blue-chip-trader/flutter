import 'package:bluechip/app/modules/notifications/widgets/notification_card.dart';
import 'package:bluechip/app/modules/signals_active/controllers/signals_active_controller.dart';
import 'package:bluechip/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/notifications/controllers/notifications_controller.dart';



class NotificationsView extends GetView<NotificationsController> {
  final SignalsActiveController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme().bcBackground,
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: true,
        backgroundColor: MyTheme().bcBackground,
      ),
      body: Center(child: Text("You have no Notifications"),)
    );
  }
}

