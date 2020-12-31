import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:bluechip/app/modules/settings_notifications/controllers/settings_notifications_controller.dart';

class SettingsNotificationsView extends GetView<SettingsNotificationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        title: Text('SettingsNotificationsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsNotificationsView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  