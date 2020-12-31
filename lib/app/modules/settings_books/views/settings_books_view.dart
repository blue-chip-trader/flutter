import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:bluechip/app/modules/settings_books/controllers/settings_books_controller.dart';

class SettingsBooksView extends GetView<SettingsBooksController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        title: Text('SettingsBooksView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SettingsBooksView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  