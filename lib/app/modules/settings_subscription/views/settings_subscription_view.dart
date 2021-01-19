import 'package:bluechip/app/modules/confirmdetails/views/confirmdetails_view.dart';
import 'package:bluechip/app/theme/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:bluechip/app/modules/settings_subscription/controllers/settings_subscription_controller.dart';
import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';

String uid = FirebaseAuth.instance.currentUser.uid.toString();
CollectionReference users = FirebaseFirestore.instance.collection('users');
SettingsSubscriptionController controller =
    Get.put(SettingsSubscriptionController());

class SettingsSubscriptionView extends GetView<SettingsSubscriptionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme().bcBackground,
      appBar: AppBar(
        title: Text('Subscription'),
        centerTitle: true,
        backgroundColor: MyTheme().bcBackground,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
              child: Text(
                "What will you get?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  Icon(
                    Icons.verified_user,
                    color: Colors.green,
                  ),
                  Text("    Profitable Trading Signals")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.verified_user,
                    color: Colors.green,
                  ),
                  Text("    Dedicated Human Support")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.verified_user,
                    color: Colors.green,
                  ),
                  Text("    Money Management Advices")
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Choose a plan",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  FutureBuilder(
                      future: users.doc(uid).get(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (ConnectionState.waiting ==
                            snapshot.connectionState) {
                          return Text(
                            " ( xxxx currently)",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.left,
                          );
                        } else {
                          Map<String, dynamic> data = snapshot.data.data();
                          String siglevel;
                          if (data['subscription'] == 0) {
                            siglevel = "Free";
                          } else if (data['subscription'] == 1) {
                            siglevel = "Starter";
                          } else if (data['subscription'] == 2) {
                            siglevel = "Pro";
                          } else if (data['subscription'] == 3) {
                            siglevel = "Pro Plus";
                          }
                          return Text(
                            " ( ${siglevel} currently)",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.left,
                          );
                        }
                      }),
                ],
              ),
            ),
            Container(
              height: 200,
              child: ListView(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 30),
                children: [
                  Obx(() => GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Starter",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Container(
                                  height: 2,
                                  width: 23,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "\$49",
                                      style: (controller.selection.value == 1)
                                          ? TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold)
                                          : TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                    ),
                                    Text(
                                      "/month",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("-  Avg. 1000 pips net profit",
                                    style: TextStyle(
                                      fontSize: 11,
                                    )),
                                Text("-  Customisable notifications",
                                    style: TextStyle(
                                      fontSize: 11,
                                    )),
                                Text(
                                    "-  50% ROI (when u follow our Money Management System)",
                                    style: TextStyle(
                                      fontSize: 11,
                                    )),
                                Text("-  Try for free for 3 Days",
                                    style: TextStyle(
                                      fontSize: 11,
                                    ))
                              ],
                            ),
                            height: 150,
                            width: 150,
                            decoration: (controller.selection.value == 1)
                                ? BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  )
                                : BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                          ),
                        ),
                        onTap: () {
                          controller.selection.value = 1;
                        },
                      )),
                  Obx(() => GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pro",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Container(
                                  height: 2,
                                  width: 23,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "\$69",
                                      style: (controller.selection.value == 2)
                                          ? TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold)
                                          : TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                    ),
                                    Text(
                                      "/month",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("-  Avg. 2000 pips net profit",
                                    style: TextStyle(
                                      fontSize: 11,
                                    )),
                                Text("-  Customisable notifications",
                                    style: TextStyle(
                                      fontSize: 11,
                                    )),
                                Text(
                                    "-  100% ROI (when u follow our Money Management System)",
                                    style: TextStyle(
                                      fontSize: 11,
                                    )),
                                Text("-  Try for free for 3 Days",
                                    style: TextStyle(
                                      fontSize: 11,
                                    ))
                              ],
                            ),
                            height: 150,
                            width: 150,
                            decoration: (controller.selection.value == 2)
                                ? BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  )
                                : BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                          ),
                        ),
                        onTap: () {
                          controller.selection.value = 2;
                        },
                      )),
                  Obx(() => GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pro Plus",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Container(
                                  height: 2,
                                  width: 23,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "\$79",
                                      style: (controller.selection.value == 3)
                                          ? TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold)
                                          : TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                    ),
                                    Text(
                                      "/month",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("-  min 3000 pips net profit",
                                    style: TextStyle(
                                      fontSize: 11,
                                    )),
                                Text("-  Customisable notifications",
                                    style: TextStyle(
                                      fontSize: 11,
                                    )),
                                Text(
                                    "-  min 150% ROI (when u follow our Money Management System)",
                                    style: TextStyle(
                                      fontSize: 11,
                                    )),
                                Text("-  Try for free for 3 Days",
                                    style: TextStyle(
                                      fontSize: 11,
                                    ))
                              ],
                            ),
                            height: 150,
                            width: 150,
                            decoration: (controller.selection.value == 3)
                                ? BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  )
                                : BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                          ),
                        ),
                        onTap: () {
                          controller.selection.value = 3;
                        },
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: new Container(
        height: 80.0,
        color: MyTheme().bcBackground,
        child: BCTButton(
          title: "Continue",
        ),
      ),
    );
  }
}

class BCTButton extends StatelessWidget {
  const BCTButton({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.purchaseIAP();
        
        

        // Get.offNamed("/home");
        // Get.snackbar(
        //     'Success', 'You are now on ' + controller.getSelection() + ' Plan');
      },
      child: Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(13))),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          )),
    );
  }
}

//   StreamBuilder(
//         // This streamBuilder reads the real-time status of SlimyCard.
//         initialData: false,
//         stream: slimyCard.stream, //Stream of SlimyCard
//         builder: ((BuildContext context, AsyncSnapshot snapshot) {
//           return ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               SizedBox(height: 50),
//               SlimyCard(
//                 // In topCardWidget below, imagePath changes according to the
//                 // status of the SlimyCard(snapshot.data).
//                 topCardWidget: topCardWidget(
//                     (snapshot.data) ? Colors.green : Colors.white,
//                     "FREE",
//                     "R0",
//                     "If you just want to explore"),
//                 bottomCardWidget: bottomCardWidget(features["free"],0),
//                 color: Colors.green,
//               ),
//               SizedBox(height: 50),

//               // SlimyCard is being called here.
//               SlimyCard(
//                 // In topCardWidget below, imagePath changes according to the
//                 // status of the SlimyCard(snapshot.data).
//                 topCardWidget: topCardWidget(
//                     (snapshot.data) ? Colors.green : Colors.white,
//                     "STARTER",
//                     "R750",
//                     "Entry in profitability"),
//                 bottomCardWidget: bottomCardWidget(features["starter"],1),
//                 color: Colors.orange,
//               ),
//               SizedBox(height: 50),
//               SlimyCard(
//                 // In topCardWidget below, imagePath changes according to the
//                 // status of the SlimyCard(snapshot.data).
//                 topCardWidget: topCardWidget(
//                     (snapshot.data) ? Colors.green : Colors.white,
//                     "Pro",
//                     "R1050",
//                     "For the Pros who are serious in getting that paper"),
//                 bottomCardWidget: bottomCardWidget(features["pro"],2),
//                 color: Colors.blue,
//               ),
//               SizedBox(height: 50),
//               SlimyCard(
//                 // In topCardWidget below, imagePath changes according to the
//                 // status of the SlimyCard(snapshot.data).
//                 topCardWidget: topCardWidget(
//                     (snapshot.data) ? Colors.green : Colors.white,
//                     "Pro Plus",
//                     "R1400",
//                     "Traders with no limits"),
//                 bottomCardWidget: bottomCardWidget(features["proplus"],3),
//                 color: MyTheme().bcPrimaryColor2,
//               ),
//               SizedBox(height: 50),
//             ],
//           );
//         }),
//       ),

//   // This widget will be passed as Top Card's Widget.
//   Widget topCardWidget(
//       Color textcolor, String package, String price, String heading) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           child: Text(
//             package,
//             style: TextStyle(
//               fontSize: 50,
//               fontWeight: FontWeight.bold,
//               color: textcolor,
//               shadows: <Shadow>[
//                 Shadow(
//                   offset: Offset(0.0, 0.0),
//                   blurRadius: 3.0,
//                 ),
//                 Shadow(
//                   offset: Offset(0.0, 0.0),
//                   blurRadius: 8.0,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(height: 15),
//         Text(
//           price,
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//         SizedBox(height: 15),
//         Text(
//           heading,
//           style: TextStyle(
//               color: Colors.white.withOpacity(0.8),
//               fontSize: 12,
//               fontWeight: FontWeight.w500),
//         ),
//         SizedBox(height: 10),
//       ],
//     );
//   }

//   // This widget will be passed as Bottom Card's Widget.
//   Widget bottomCardWidget(String pfeatures, int option) {
//     return SingleChildScrollView(
//       physics: NeverScrollableScrollPhysics(),
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Text(
//             pfeatures,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 12,
//               fontWeight: FontWeight.w500,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           BCTButton(
//             title: "Select",
//             subing: option,
//           ),
//           SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
// }

// class BCTButton extends StatelessWidget {
//   const BCTButton({
//     Key key,
//     this.title, this.subing,
//   }) : super(key: key);
//   final String title;
//   final int subing;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         users.doc(uid).update({
//           'subscription': subing, // John Doe
//         });
//         Get.offNamed("/home");
//         Get.snackbar('Hi', 'Thanks for becoming :'+subing.toString());
//         // _authcontroller.handleSignOut();
//         //Get.snackbar('Signed Out', 'Sad to see you going...');
//       },
//       child: Container(
//           margin: EdgeInsets.all(15),
//           width: double.infinity,
//           height: 50,
//           decoration: BoxDecoration(
//               color: MyTheme().bcButtonColor,
//               borderRadius: BorderRadius.all(Radius.circular(13))),
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(12),
//               child: Text(
//                 title,
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//           )),
//     );
//   }
// }

// Map features = {
//   'free':
//       '✔ One signal a day \n ✔One Notification a day \n No support \n No Session Selection',
//   'starter':
//       '✔ One signal a day \n ✔One Notification a day \n No support \n No Session Selection',
//   'pro':
//       '✔ One signal a day \n ✔One Notification a day \n No support \n No Session Selection',
//   'proplus':
//       '✔ One signal a day \n ✔One Notification a day \n No support \n No Session Selection'
// };
