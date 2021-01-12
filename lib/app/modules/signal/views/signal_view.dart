import 'dart:ui';

import 'package:bluechip/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/signal/controllers/signal_controller.dart';
import 'package:intl/intl.dart';

class SignalView extends GetView<SignalController> {
 

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
          return FutureBuilder(
              future: value.getSignal(id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  Map<String, dynamic> data = snapshot.data.data();
                  return Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.all(15),
                              width: double.infinity,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: MyTheme().bcPrimaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              child: Column(children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      data['pair'],
                                      style: TextStyle(
                                          color: MyTheme().bcSignalText,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Divider(),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Status"),
                                    Text(data['active'] ? "Open" : "Closed")
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Profit/Loss"),
                                    Text(
                                      data['p/l'] == null
                                          ? "- - - - -"
                                          : data['p/l'],
                                      style: priceColor(data['p/l']),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Sent On"),
                                    Text(DateFormat.yMMMd()
                                        .add_jm()
                                        .format(data['opened at'].toDate()))
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Closed On"),
                                    Text(data['closed at'] == null
                                        ? "- - - - -"
                                        : DateFormat.yMMMd()
                                            .add_jm()
                                            .format(data['closed at'].toDate()))
                                  ],
                                ),
                              ])),
                          Container(
                              margin: EdgeInsets.all(15),
                              width: double.infinity,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: MyTheme().bcPrimaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              child: Column(children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "How to trade?",
                                      style: TextStyle(
                                          color: MyTheme().bcSignalText,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Divider(),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data["direction"] ? "BUY" : "SELL",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyTheme().bcButtonColor),
                                    ),
                                    Text("@" + data['price'])
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Stoploss"),
                                    Text(
                                      data['sl'],
                                      style: TextStyle(color: Colors.redAccent),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Take Profit",
                                    ),
                                    Text(data['tp'],
                                        style: TextStyle(
                                          color: Colors.green,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ])),
                        ],
                      ),
                    ),
                  );
                }
              });
        }));
  }
}

//Center(child: Text(data['pair']));
priceColor(String pl) {
  if (pl != null) {
    if (pl.contains("+")) {
      return TextStyle(color: Colors.green);
    } else {
      return TextStyle(color: Colors.red);
    }
  }
}
