import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:bluechip/app/modules/settings_email/controllers/settings_email_controller.dart';

class SettingsEmailView extends GetView<SettingsEmailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        title: Text('SettingsEmailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsEmailView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  