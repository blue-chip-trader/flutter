import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String verificationCode;
  

  Stream<User> onAuthChanged() {
    return _firebaseAuth.authStateChanges();
  }

  Future signInWithPhone() async {
    //final String phoneNum;
    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+27671760340',
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
          verificationCode = verficationID;
          print(verificationCode);
        },
        codeAutoRetrievalTimeout: (String verificationID) {},
        timeout: Duration(seconds: 0));
  }

  Future<String> signInWithGoogle() async {
    
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
    User user = await _firebaseAuth.currentUser;
    return user.uid;
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<User> getCurrentUser() async {
    User user = await _firebaseAuth.currentUser;
    return user;
  }

  Future<String> getAccessToken() async {
    User user = await getCurrentUser();
    IdTokenResult tokenResult = await user.getIdTokenResult();
    return tokenResult.token;
  }

  Future<String> getRefreshToken() async {
    User user = await _firebaseAuth.currentUser;
    IdTokenResult tokenResult = await user.getIdTokenResult();
    return tokenResult.token;
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  Future<void> sendEmailVerification() async {
    User user = await _firebaseAuth.currentUser;
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    User user = await _firebaseAuth.currentUser;
    return user.emailVerified;
  }

  @override
  Future<void> changeEmail(String email) async {
    User user = await _firebaseAuth.currentUser;
    return user.updateEmail(email);
  }

  @override
  Future<void> deleteUser() async {
    User user = await _firebaseAuth.currentUser;
    user.delete().then((_) {
      print("Succesfull user deleted");
    }).catchError((error) {
      print("user can't be delete" + error.toString());
    });
    return null;
  }
}
