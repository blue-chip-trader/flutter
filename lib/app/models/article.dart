import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleModel {
  String id;
  String title;
  String body;
  String timestamp;
  String imgurl;
  String source;
  String link;
  String category;

  ArticleModel(this.id, this.title, this.body, this.timestamp, this.imgurl,
      this.source, this.link, this.category);

  ArticleModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    id = documentSnapshot.id;
    title = documentSnapshot.data()["title"];
    body = documentSnapshot.data()["body"];
    timestamp = documentSnapshot.data()["timestamp"];
    imgurl = documentSnapshot.data()["imgurl"];
    source = documentSnapshot.data()["source"];
    link = documentSnapshot.data()["link"];
    category = documentSnapshot.data()["category"];
  }
}
