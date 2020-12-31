import 'dart:ui';

import 'package:bluechip/app/modules/signals_active/controllers/signals_active_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/signal/controllers/signal_controller.dart';

class SignalView extends GetView<SignalController> {
  SignalsActiveController _signalsActiveController =
      Get.put(SignalsActiveController());
  @override
  Widget build(BuildContext context) {
    String id = Get.arguments;
    return Scaffold(
        backgroundColor: Color(0xFF000000),
        appBar: AppBar(
          title: Text('Signal #' + id),
          centerTitle: true,
          backgroundColor: Color(0xFF0E0E0F),
        ),
        body: GetBuilder<SignalController>(builder: (value) {
          return FutureBuilder(future: value.getSignal(id),
          builder: (context,snapshot){
            if(snapshot.connectionState==nuFatal error: [File:D:/Build/++Portal+Release-Live+Compile/Sync/Engine/Source/Runtime/Core/Private/Internationalization/ICUInternationalization.cpp] [Line: 136] 
ICU data directory was not discovered:
../../../Engine/Programs/CrashReportClient/Content/Internationalization
../../../Engine/Content/Internationalization


ll)
          },);
        }));
  }
}
