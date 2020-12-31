import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String id;
  String timestamp;
  String date;
  String country;
  String priority;
  String title;
  String previous;
  String forecast;
  String actual;
  bool upcoming;

  EventModel(this.id, this.actual, this.country, this.date, this.forecast,
      this.previous, this.priority, this.timestamp, this.title, this.upcoming);

  EventModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.data()["id"];
    timestamp = documentSnapshot.data()["timestamp"];
    date = documentSnapshot.data()["date"];
    country = documentSnapshot.data()["country"];
    priority = documentSnapshot.data()["priority"];
    title = documentSnapshot.data()["title"];
    previous = documentSnapshot.data()["previous"];
    forecast = documentSnapshot.data()["forecast"];
    actual = documentSnapshot.data()["actual"];
    upcoming = documentSnapshot.data()["upcoming"];
  }
}
