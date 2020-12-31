import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String displayName;
  bool mentor;
  String phoneNumber;
  String email;
  String session;
  bool eventsNotifs;
  bool newsNotifs;
  String displayPic;

  UserModel(
      this.id,
      this.displayName,
      this.mentor,
      this.phoneNumber,
      this.email,
      this.session,
      this.eventsNotifs,
      this.newsNotifs,
      this.displayPic);

  UserModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    id = documentSnapshot.id;
    displayName = documentSnapshot.data()["displayName"];
    mentor = documentSnapshot.data()["mentor"];
    phoneNumber = documentSnapshot.data()["phoneNumber"];
    email = documentSnapshot.data()["email"];
    session = documentSnapshot.data()["session"];
    eventsNotifs = documentSnapshot.data()["eventsNotifs"];
    newsNotifs = documentSnapshot.data()["newsNotifs"];
    displayPic = documentSnapshot.data()["displayPic"];
  }
}
