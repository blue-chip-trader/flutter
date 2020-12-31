import 'package:bluechip/app/services/auth.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();

  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _User = Rx<User>();

  User get user => _User.value;
  RxBool isLogged = false.obs;
  String _verificationCode;
  AuthService _authService;

  AuthController() {
    _authService = AuthService();
  }

  Stream<User> onAuthChanged() {
    return _auth.authStateChanges();
  }

  Future signInWithPhone(String phoneNum) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNum,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {}
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          _verificationCode = verficationID;
          print(_verificationCode);
        },
        codeAutoRetrievalTimeout: (String verificationID) {},
        timeout: Duration(seconds: 0));
  }

  codeVerify(pin) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: _verificationCode, smsCode: pin))
          .then((value) async {
        if (value.user != null) {
          Get.toNamed("/home");
        }
      });
    } catch (e) {
      Get.snackbar('Error', 'Invalid Code');
      print(e.message);
    }
  }

  @override
  void onInit() async {
    ever(isLogged, handleAuthChanged);
    _User.value = await _authService.getCurrentUser();
    isLogged.value = _User.value != null;
    _authService.onAuthChanged().listen((event) {
      isLogged.value = event != null;
      _User.value = event;
    });
    super.onInit();
  }

  @override
  void onClose() {}

  handleAuthChanged(isLoggedIn) {
    if (isLoggedIn == false) {
      Get.offAllNamed("/auth");
    } else {
      Get.offAllNamed("/home");
    }
  }

  handleSignIn(SignInType type, String phoneNum) async {
    Get.snackbar("Signing In", "Loading",
        showProgressIndicator: true,
        progressIndicatorBackgroundColor: Color(0xFF38A6DD),
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(minutes: 2));
    try {
      if (type == SignInType.PHONE) {
        await signInWithPhone(phoneNum);
      }
      if (type == SignInType.GOOGLE) {
        await _authService.signInWithGoogle();
      }
    } catch (e) {
      Get.back();
      Get.defaultDialog(title: "Error", middleText: e.message, actions: [
        FlatButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Close"),
        ),
      ]);
      print(e);
    }
  }

  handleSignOut() {
    _authService.signOut();
    Get.offAllNamed("/auth");
  }
}

enum SignInType { PHONE, GOOGLE }
