import 'package:bluechip/app/services/auth.service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();

  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _User = Rx<User>();

  TextEditingController phoneController = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User get user => _User.value;
  RxBool isLogged = false.obs;
  String _verificationCode;
  AuthService _authService;

  AuthController() {
    _authService = AuthService();
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  // Future<void> addUser(id, phoneemail, signInType) {
  //   // Call the user's CollectionReference to add a new user
  //   if (signInType == SignInType.GOOGLE) {
  //     return users
  //         .doc(user.uid)
  //         .set({
  //           'dname': user.displayName,
  //           'phone': "", // John Doe
  //           'email': phoneemail, // Stokes and Sons
  //           'ppic': user.photoURL.toString() // 42
  //         })
  //         .then((value) => print("User Added"))
  //         .catchError((error) => print("Failed to add user: $error"));
  //   } else {
  //     return users
  //         .doc(user.uid)
  //         .set({'phone': phoneemail, 'email': "", 'dname': ""})
  //         .then((value) => print("User Added"))
  //         .catchError((error) => print("Failed to add user: $error"));
  //   }
  // }

  Stream<User> onAuthChanged() {
    return _auth.authStateChanges();
  }

  getSnack() {
    Get.snackbar(
      "Signing In",
      "Loading",
      showProgressIndicator: true,
      isDismissible: true,
      borderRadius: 10,
      progressIndicatorBackgroundColor: Color(0xFF38A6DD),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future signInWithPhone(String phoneNum) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNum,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              FirebaseFirestore.instance
                  .collection('users')
                  .doc(_auth.currentUser.uid)
                  .get()
                  .then((DocumentSnapshot documentSnapshot) {
                if (!documentSnapshot.exists) {
                  users.add({
                    'id': _auth.currentUser.uid,
                    'dname': 'Add your name',
                    'email': 'add email',
                    'subscription': "Free", // John Doe
                  });
                  Get.toNamed("/confirmdetails",
                      arguments: phoneController.text.toString());
                  print('Document doesnt exist on the database');
                } else {
                  Get.toNamed("/confirmdetails",
                      arguments: phoneController.text.toString());
                  print('Document exists on the database');
                }
              });
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
          Get.back();
          Get.snackbar('Error',
              "Invalid Number, make sure you include your country code starting with a '+'",
              isDismissible: true,
              titleText: Text(
                "Error",
              ),
              duration: Duration(seconds: 20));
        },
        codeSent: (String verficationID, int resendToken) {
          Get.back();
          Get.snackbar('Success', "SMS Sent!",
              isDismissible: true,
              titleText: Text(
                "Success",
              ),
              duration: Duration(seconds: 10));
          _verificationCode = verficationID;
          Future.delayed(const Duration(seconds: 2), () {
            Get.toNamed("/otp", arguments: phoneController.text.toString());
          });
          //Get.toNamed("/otp", arguments: phoneController.text.toString());
        },
        codeAutoRetrievalTimeout: (String verificationID) {},
        timeout: Duration(seconds: 60));
  }

  codeVerify(pin) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: _verificationCode, smsCode: pin))
          .then((value) async {
        if (value.user != null) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(_auth.currentUser.uid)
              .get()
              .then((DocumentSnapshot documentSnapshot) {
            if (!documentSnapshot.exists) {
              addUser();

              Get.toNamed("/confirmdetails",
                  arguments: phoneController.text.toString());
              print('Document doesnt exists on the database');
            } else {
              Get.toNamed("/confirmdetails",
                  arguments: phoneController.text.toString());
              print('Document exists on the database');
            }
          });

          // return Get.offAllNamed("/confirmdetails");
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
  void onClose() {
    Get.isSnackbarOpen ? Get.back() : Get.back();
  }

  handleAuthChanged(isLoggedIn) {
    if (isLoggedIn == false) {
      Get.offAllNamed("/auth");
    }
  }

  handleSignIn(String phoneNum) async {
    try {
      await signInWithPhone(phoneNum);
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

  Future<String> signInWithGoogle() async {
    Get.snackbar("Signing In", "Loading",
        showProgressIndicator: true,
        progressIndicatorBackgroundColor: Color(0xFF38A6DD),
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(minutes: 2));
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _auth.signInWithCredential(credential);
    User user = await _auth.currentUser;
    //addUser(user.uid, user.email, SignInType.GOOGLE);
    return user.uid;
  }

  addUser() {
    users
        .doc(_auth.currentUser.uid)
        .set({
          'dname': 'Add your name',
          'email': 'add email',
          'phone': user.phoneNumber,
          'subscription': 0,
          'signalsnotifs': true
          // John Doe
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  handleSignOut() {
    _authService.signOut();
    Get.offAllNamed("/auth");
  }
}

enum SignInType { PHONE, GOOGLE }
