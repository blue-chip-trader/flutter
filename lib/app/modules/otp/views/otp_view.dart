import 'package:bluechip/app/modules/auth/controllers/auth_controller.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/otp/controllers/otp_controller.dart';
import 'package:pinput/pin_put/pin_put.dart';

AuthController _authController = Get.put(AuthController());

class OtpView extends GetView<OtpController> {
  //AuthController _authController = Get.put(AuthController());
  final String phoneNumber = Get.arguments;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    _authController.handleSignIn(SignInType.PHONE,phoneNumber);
    return Scaffold(
        backgroundColor: Color(0xFF2A2B32),
        appBar: AppBar(
          title: Text('PhoneView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  'Verify ${phoneNumber}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: PinPut(
                fieldsCount: 6,
                textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
                eachFieldWidth: 40.0,
                eachFieldHeight: 55.0,
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                keyboardType: TextInputType.phone,
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration,
                pinAnimationType: PinAnimationType.fade,
                onSubmit: (pin) {
                  _authController.codeVerify(pin);
                },
              ),
            )
          ],
        ));
  }
}
