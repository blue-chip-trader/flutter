import 'package:cloud_firestore/cloud_firestore.dart';

class MentorModel {
  String id;
  String uid;

  MentorModel(
    this.id,
    this.uid,
  );

  MentorModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    id = documentSnapshot.id;
    uid = documentSnapshot.data()["uid"];
  }
}
