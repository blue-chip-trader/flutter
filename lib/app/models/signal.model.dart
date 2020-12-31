import 'package:cloud_firestore/cloud_firestore.dart';

class SignalModel {
  String signalId;
  String pair;
  String price;
  String sl;
  String tp;
  bool direction;
  String flag1;
  String flag2;
  bool active;
  String timeOpened;
  String timeClosed;
  bool won;
  String profit;

  SignalModel(
      this.signalId,
      this.pair,
      this.price,
      this.sl,
      this.direction,
      this.tp,
      this.active,
      this.flag1,
      this.flag2,
      this.profit,
      this.timeClosed,
      this.timeOpened,
      this.won);

  SignalModel.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    signalId = documentSnapshot.id;
    pair = documentSnapshot.data()["pair"];
    price = documentSnapshot.data()["price"];
    sl = documentSnapshot.data()["sl"];
    tp = documentSnapshot.data()["tp"];
    direction = documentSnapshot.data()["direction"];
    active = documentSnapshot.data()["active"];
    flag1 = documentSnapshot.data()["flag1"];
    flag2 = documentSnapshot.data()["flag2"];
    profit = documentSnapshot.data()["profit"];
    timeClosed = documentSnapshot.data()["timeClosed"];
    timeOpened = documentSnapshot.data()["timeOpened"];
    won = documentSnapshot.data()["won"];
  }
}
