import 'package:bluechip/app/models/onesignal.model.dart';
import 'package:bluechip/app/models/signal.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<SignalModel>> signalStream() {
    return _firestore
        .collection("signals")
        .doc("forex")
        .collection("signal")
        .snapshots()
        .map((QuerySnapshot query) {
      List<SignalModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(SignalModel.fromDocumentSnapshot(element));
      });
      return retVal.toList();
    });
  }

  Future<SignalModel> findOne(String id) async {
    var result = await _firestore
        .collection("signals")
        .doc("forex")
        .collection("signal")
        .doc(id)
        .get();
    return SignalModel.fromDocumentSnapshot(result);
  }

  Future<OneSignalModel>getSignal(String id) async {
    try {
      DocumentSnapshot _doc = await _firestore
          .collection("signals")
          .doc("forex")
          .collection("signal")
          .doc(id)
          .get();

      return OneSignalModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
