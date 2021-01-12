import 'package:bluechip/app/presentation/blue_chip_icons_icons.dart';
import 'package:bluechip/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/auth/controllers/auth_controller.dart';

AuthController controller = Get.put(AuthController());

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Center(
        child: Container(
          height: 350,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF151516),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.black38.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("assets/images/bclogo.png",
                    height: 30, alignment: Alignment.center),
              ),
              // GestureDetector(
              //   onTap: () {
              //     controller.handleSignIn(SignInType.GOOGLE,"");
              //     print("signin pressed");
              //   },
              //   child: Container(
              //       margin: EdgeInsets.all(15),
              //       width: double.infinity,
              //       decoration: BoxDecoration(
              //           color: Color(0xFF38A6DD),
              //           borderRadius: BorderRadius.all(Radius.circular(10))),
              //       child: Row(
              //         children: [
              //           Container(
              //             padding: EdgeInsets.all(12),
              //             width: 45,
              //             child: Image.asset("assets/images/google.png"),
              //             height: 45,
              //             decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.only(
              //                     topLeft: Radius.circular(10),
              //                     bottomLeft: Radius.circular(10))),
              //           ),
              //           Expanded(
              //             child: Center(
              //               child: Padding(
              //                 padding: const EdgeInsets.all(12),
              //                 child: Text(
              //                   "Sign In With Google",
              //                   style: TextStyle(
              //                       fontSize: 18, fontWeight: FontWeight.bold),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ],
              //       )),
              // ),
              Divider(),
              _buildPhoneTF(),
              GestureDetector(
                onTap: () {
                  controller.signInWithPhone(
                      controller.phoneController.text.toString());
                  // Get.toNamed("/otp",
                  //     arguments: controller.phoneController.text.toString());
                  //Get.snackbar('Signed Out', 'Sad to see you going...');
                },
                child: Container(
                    margin: EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFF38A6DD),
                        borderRadius: BorderRadius.all(Radius.circular(13))),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          "Sign In With Phone",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              Text("By signing in, you agree with the"),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                  onTap: () {
                    Get.toNamed("/settings-terms");
                  },
                  child: Text(
                    "Terms & Conditions.",
                    style: TextStyle(color: MyTheme().bcButtonColor),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildPhoneTF() {
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
          keyboardType: TextInputType.phone,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          controller: controller.phoneController,
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              BlueChipIcons.call,
              color: Colors.white,
            ),
            hintText: '+27712345678',
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
