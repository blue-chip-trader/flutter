import 'package:bluechip/app/theme/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:bluechip/app/modules/settings_terms/controllers/settings_terms_controller.dart';

class SettingsTermsView extends GetView<SettingsTermsController> {
          CollectionReference terms = FirebaseFirestore.instance.collection('terms');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        title: Text('SettingsTermsView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
              child: Center(
          child: GetBuilder<SettingsTermsController>(
            builder: (value) {
              return FutureBuilder(
                future: terms.doc("terms").get(),
                builder: (context, snapshot) {
                  return Container(
                          padding: EdgeInsets.all(15),
                                            margin: EdgeInsets.all(15),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color:  MyTheme().bcPrimaryColor,
                                                    
                                                borderRadius:
                                                    BorderRadius.all(Radius.circular(13))),
                                                    child: Text(snapshot.data),
                        );
                }
              ); 
            },
          )
        ),
      ),
    );
  }
}
  