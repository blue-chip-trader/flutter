import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:bluechip/app/modules/settings_support/controllers/settings_support_controller.dart';

class SettingsSupportView extends GetView<SettingsSupportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        title: Text('SettingsSupportView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsSupportView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  