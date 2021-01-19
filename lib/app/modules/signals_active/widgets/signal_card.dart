import 'package:bluechip/app/modules/signals_active/controllers/signals_active_controller.dart';
import 'package:bluechip/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String uid = FirebaseAuth.instance.currentUser.uid.toString();
CollectionReference users = FirebaseFirestore.instance.collection('users');
bool _isLocked;

// int usersub;

class SignalCard extends StatelessWidget {
  const SignalCard(
      {Key key,
      @required this.controller,
      this.pair,
      this.price,
      this.sl,
      this.tp,
      this.buy,
      this.myindex,
      this.flag1,
      this.flag2,
      this.subscription,
      this.usersub, this.sid})
      : super(key: key);

  final SignalsActiveController controller;
  final String pair, price, tp, sl, myindex, flag1, flag2,sid;
  final bool buy;
  final int subscription;
  final int usersub;


  @override
  Widget build(BuildContext context) {
    String siglevel;

    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(uid)
    //     .get()
    //     .then((DocumentSnapshot doc) => {usersub = doc['subscription']});

    if (subscription == 0) {
      siglevel = "Free";
    } else if (subscription == 1) {
      siglevel = "Starter";
    } else if (subscription == 2) {
      siglevel = "Pro";
    } else if (subscription == 3) {
      siglevel = "Pro Plus";
    }

    final appData = GetStorage();

    //int level = 3;
    bool _isDarkMode = appData.read("_isDark");
    return GestureDetector(
      onTap: () {
        if (subscription > usersub) {
          Get.snackbar("Locked", "Upgrade to access more profitable Signals");
        } else {
          Get.toNamed("/signal", arguments: [myindex,sid]);
        }
      },
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          padding: new EdgeInsets.all(10.0),
          width: double.infinity,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: _isDarkMode
                ? MyTheme().bcPrimaryColor
                : MyThemeLight().bcPrimaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.network(
                        controller.flags[flag1],
                        height: 11.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.network(
                        controller.flags[flag2],
                        height: 11.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(pair,
                      style: TextStyle(
                        fontSize: 11,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  (subscription > usersub)
                      ? Text("0.0000",
                          style: TextStyle(
                            fontSize: 12,
                          ))
                      : Text(price,
                          style: TextStyle(
                            fontSize: 12,
                          ))
                ],
              ),
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (buy == true)
                          ? Container(
                              alignment: Alignment.center,
                              child: Text("BUY",
                                  style: TextStyle(
                                    fontSize: 11,
                                  )),
                              padding: EdgeInsets.all(5),
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Color(0xFF2A4236),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                            )
                          : Container(
                              alignment: Alignment.center,
                              child: Text("SELL",
                                  style: TextStyle(
                                    fontSize: 11,
                                  )),
                              padding: EdgeInsets.all(5),
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Color(0xFF782427),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                            ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "SL: " + sl,
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text("TP: " + tp,
                          style: TextStyle(
                            fontSize: 11,
                          )),
                    ],
                  ),
                  if (subscription > usersub)
                    Container(
                      height: 60,
                      width: 80,
                      color: MyTheme().bcPrimaryColor2,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.lock), Text(siglevel)],
                        ),
                      ),
                    )
                ],
              )
            ],
          ),
        ),
        Align(
          child: Container(
            decoration: BoxDecoration(
                color: _isDarkMode
                    ? MyTheme().bcPrimaryColor2
                    : MyThemeLight().bcPrimaryColor2,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            margin: EdgeInsets.all(10.0),
            child: VxShimmer(child: Text("Running...")),
          ),
        )
      ]),
    );
  }
}
