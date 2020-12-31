import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:bluechip/app/modules/settings_faqs/controllers/settings_faqs_controller.dart';

class SettingsFaqsView extends GetView<SettingsFaqsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        title: Text('SettingsFaqsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsFaqsView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  