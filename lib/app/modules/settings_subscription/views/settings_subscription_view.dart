import 'package:bluechip/app/modules/confirmdetails/views/confirmdetails_view.dart';
import 'package:bluechip/app/theme/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:bluechip/app/modules/settings_subscription/controllers/settings_subscription_controller.dart';

String uid = FirebaseAuth.instance.currentUser.uid.toString();
CollectionReference users = FirebaseFirestore.instance.collection('users');

class SettingsSubscriptionView extends GetView<SettingsSubscriptionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme().bcBackground,
      appBar: AppBar(
        title: Text('Subscriptions'),
        centerTitle: true,
        backgroundColor: MyTheme().bcBackground,
      ),
      body: StreamBuilder(
        // This streamBuilder reads the real-time status of SlimyCard.
        initialData: false,
        stream: slimyCard.stream, //Stream of SlimyCard
        builder: ((BuildContext context, AsyncSnapshot snapshot) {
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: 50),
              SlimyCard(
                // In topCardWidget below, imagePath changes according to the
                // status of the SlimyCard(snapshot.data).
                topCardWidget: topCardWidget(
                    (snapshot.data) ? Colors.green : Colors.white,
                    "FREE",
                    "R0",
                    "If you just want to explore"),
                bottomCardWidget: bottomCardWidget(features["free"],"Free"),
                color: Colors.green,
              ),
              SizedBox(height: 50),

              // SlimyCard is being called here.
              SlimyCard(
                // In topCardWidget below, imagePath changes according to the
                // status of the SlimyCard(snapshot.data).
                topCardWidget: topCardWidget(
                    (snapshot.data) ? Colors.green : Colors.white,
                    "STARTER",
                    "R750",
                    "Entry in profitability"),
                bottomCardWidget: bottomCardWidget(features["starter"],"Starter"),
                color: Colors.orange,
              ),
              SizedBox(height: 50),
              SlimyCard(
                // In topCardWidget below, imagePath changes according to the
                // status of the SlimyCard(snapshot.data).
                topCardWidget: topCardWidget(
                    (snapshot.data) ? Colors.green : Colors.white,
                    "Pro",
                    "R1050",
                    "For the Pros who are serious in getting that paper"),
                bottomCardWidget: bottomCardWidget(features["pro"],"Pro"),
                color: Colors.blue,
              ),
              SizedBox(height: 50),
              SlimyCard(
                // In topCardWidget below, imagePath changes according to the
                // status of the SlimyCard(snapshot.data).
                topCardWidget: topCardWidget(
                    (snapshot.data) ? Colors.green : Colors.white,
                    "Pro Plus",
                    "R1400",
                    "Traders with no limits"),
                bottomCardWidget: bottomCardWidget(features["proplus"],"Pro Plus"),
                color: MyTheme().bcPrimaryColor2,
              ),
              SizedBox(height: 50),
            ],
          );
        }),
      ),
    );
  }

  // This widget will be passed as Top Card's Widget.
  Widget topCardWidget(
      Color textcolor, String package, String price, String heading) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Text(
            package,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: textcolor,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0.0, 0.0),
                  blurRadius: 3.0,
                ),
                Shadow(
                  offset: Offset(0.0, 0.0),
                  blurRadius: 8.0,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 15),
        Text(
          price,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(height: 15),
        Text(
          heading,
          style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  Widget bottomCardWidget(String pfeatures, String option) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            pfeatures,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          BCTButton(
            title: "Select",
            subing: option,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class BCTButton extends StatelessWidget {
  const BCTButton({
    Key key,
    this.title, this.subing,
  }) : super(key: key);
  final String title;
  final String subing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        users.doc(uid).update({
          'subscription': subing, // John Doe
        });
        Get.offNamed("/home");
        Get.snackbar('Hi', 'Thanks for becoming :'+subing);
        // _authcontroller.handleSignOut();
        //Get.snackbar('Signed Out', 'Sad to see you going...');
      },
      child: Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: MyTheme().bcButtonColor,
              borderRadius: BorderRadius.all(Radius.circular(13))),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          )),
    );
  }
}

Map features = {
  'free':
      '✔ One signal a day \n ✔One Notification a day \n No support \n No Session Selection',
  'starter':
      '✔ One signal a day \n ✔One Notification a day \n No support \n No Session Selection',
  'pro':
      '✔ One signal a day \n ✔One Notification a day \n No support \n No Session Selection',
  'proplus':
      '✔ One signal a day \n ✔One Notification a day \n No support \n No Session Selection'
};
