import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:bluechip/app/modules/settings_phone/controllers/settings_phone_controller.dart';

class SettingsPhoneView extends GetView<SettingsPhoneController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        title: Text('SettingsPhoneView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsPhoneView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  