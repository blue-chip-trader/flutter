import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:bluechip/app/modules/settings_theme/controllers/settings_theme_controller.dart';

class SettingsThemeView extends GetView<SettingsThemeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        title: Text('SettingsThemeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsThemeView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  