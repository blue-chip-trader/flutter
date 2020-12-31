
import 'package:cloud_firestore/cloud_firestore.dart';

class OneSignalModel {
   String signalId;
  String pair;
  String price;
  String sl;
  String tp;
  String direction;
  bool active;

  OneSignalModel({this.signalId, this.pair, this.price, this.sl, this.direction,
      this.tp, this.active});

  OneSignalModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    signalId = documentSnapshot.id;
    pair = documentSnapshot.data()["pair"];
    price = documentSnapshot.data()["price"];
    sl = documentSnapshot.data()["sl"];
    tp = documentSnapshot.data()["tp"];
    direction = documentSnapshot.data()["direction"];
    active = documentSnapshot.data()["active"];
  }
}