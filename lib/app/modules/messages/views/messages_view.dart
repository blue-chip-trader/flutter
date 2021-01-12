import 'package:bluechip/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:bluechip/app/modules/messages/controllers/messages_controller.dart';

class MessagesView extends GetView<MessagesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme().bcBackground,
      appBar: AppBar(
        title: Text('Messages'),
        centerTitle: true,
        backgroundColor: MyTheme().bcBackground,
      ),
      body: Center(
        child: Image.asset("assets/images/comingsoon.jpg")
      ),
    );
  }
}
  