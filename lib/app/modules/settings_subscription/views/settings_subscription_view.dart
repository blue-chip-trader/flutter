import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:bluechip/app/modules/settings_subscription/controllers/settings_subscription_controller.dart';

class SettingsSubscriptionView extends GetView<SettingsSubscriptionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        title: Text('SettingsSubscriptionView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsSubscriptionView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  