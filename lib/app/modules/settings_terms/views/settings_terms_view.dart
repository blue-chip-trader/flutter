import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:bluechip/app/modules/settings_terms/controllers/settings_terms_controller.dart';

class SettingsTermsView extends GetView<SettingsTermsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        title: Text('SettingsTermsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsTermsView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  