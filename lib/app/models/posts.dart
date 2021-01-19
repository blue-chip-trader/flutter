import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String id;
  String uid;
  bool video;
  String url;
  String title;
  int likes;
  int comments;

  PostModel(
      this.id,
      this.uid,
      this.video,
      this.url,
      this.title,
      this.likes,
      this.comments);

  PostModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    id = documentSnapshot.id;
    uid = documentSnapshot.data()["uid"];
    video = documentSnapshot.data()["true"];
    url = documentSnapshot.data()["imageurl"];
    title = documentSnapshot.data()["title"];
    likes = documentSnapshot.data()["likes"];
    comments = documentSnapshot.data()["comments"];
  }
}
