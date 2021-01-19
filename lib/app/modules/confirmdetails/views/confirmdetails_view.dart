import 'package:bluechip/app/presentation/blue_chip_icons_icons.dart';
import 'package:bluechip/app/theme/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/confirmdetails/controllers/confirmdetails_controller.dart';

ConfirmdetailsController _controller = Get.put(ConfirmdetailsController());
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController emailController = TextEditingController();
String displayName;
String bcEmail;

class ConfirmdetailsView extends GetView<ConfirmdetailsController> {
  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details Confirmation'),
          centerTitle: true,
          backgroundColor: MyTheme().bcBackground,
        ),
        backgroundColor: MyTheme().bcBackground,
        body: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection("users")
                .doc(user.uid)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                Map<String, dynamic> data = snapshot.data.data();
                nameController.text = data['dname'];
                phoneController.text = user.phoneNumber;
                emailController.text = data['email'];
                displayName = data['dname'];
                bcEmail = data['email'];
                return Center(
                  child: SingleChildScrollView(
                    child: Container(
                        margin: EdgeInsets.all(15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: MyTheme().bcAppBarColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(13))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: MyTheme().bcPrimaryColor2,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://simplyilm.com/wp-content/uploads/2017/08/temporary-profile-placeholder-1.jpg")),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 28, horizontal: 10),
                                    child: Icon(
                                      Icons.edit,
                                      size: 10,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  _buildPhoneTF(
                                    "Display Name",
                                    BlueChipIcons.profile,
                                    TextInputType.text,
                                    nameController,
                                    1,
                                    false,
                                  ),
                                  _buildPhoneTF(
                                      "+1 23456789",
                                      BlueChipIcons.call,
                                      TextInputType.phone,
                                      phoneController,
                                      2,
                                      true),
                                  _buildPhoneTF(
                                      "username@email.com",
                                      BlueChipIcons.message,
                                      TextInputType.emailAddress,
                                      emailController,
                                      3,
                                      false),
                                ],
                              ),
                              Column(
                                children: [
                                  Divider(),
                                  BCTButton(
                                    title: "Done",
                                    dname: nameController.text,
                                    phone: phoneController.text,
                                    email: emailController.text,
                                  )
                                ],
                              )
                            ])),
                  ),
                );
              }
            }));
  }
}

Widget _buildPhoneTF(
  String hint,
  IconData icon,
  TextInputType inputType,
  bccontroller,
  int tvalue,
  bool readonly,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.all(15),
        decoration: kBoxDecorationStyle,
        height: 50.0,
        child: TextField(
          keyboardType: inputType,
          readOnly: readonly,
          onChanged: (value) {
            if (tvalue == 1) {
              displayName = value;
            } else {
              bcEmail = value;
            }
          },
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          controller: bccontroller,
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            ),
            hintText: hint,
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ],
  );
}

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF151516),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

class BCTButton extends StatelessWidget {
  const BCTButton({
    Key key,
    this.title,
    this.dname,
    this.phone,
    this.email,
  }) : super(key: key);
  final String title;

  final String dname;
  final String phone;
  final String email;

  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser.uid.toString();
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    FirebaseMessaging.instance.subscribeToTopic("signal");
    return GestureDetector(
      onTap: () {
        users.doc(uid).update({
          'dname': displayName, // John Doe
          'phone': phone, // Stokes and Sons
          'email': bcEmail,
          // 'ctoken': ctoken // 42
        });
        print("token: ");
        // _authcontroller.handleSignOut();
        Get.offNamed("/home");
      },
      child: Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue,
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
