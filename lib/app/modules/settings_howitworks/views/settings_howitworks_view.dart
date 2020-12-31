import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:bluechip/app/modules/settings_howitworks/controllers/settings_howitworks_controller.dart';

class SettingsHowitworksView extends GetView<SettingsHowitworksController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        title: Text('SettingsHowitworksView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsHowitworksView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  