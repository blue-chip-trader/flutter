import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:bluechip/app/modules/settings_profile/controllers/settings_profile_controller.dart';

class SettingsProfileView extends GetView<SettingsProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Center(child:
        Container(
                    margin: EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFF2A2B32),
                        borderRadius: BorderRadius.all(Radius.circular(13))),
                    child: Column(children: [
                      
                    ])),
      ),
    );
  }
}
  