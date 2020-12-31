import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:bluechip/app/modules/settings_about/controllers/settings_about_controller.dart';

class SettingsAboutView extends GetView<SettingsAboutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        title: Text('SettingsAboutView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsAboutView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  