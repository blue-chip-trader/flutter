import 'package:bluechip/app/models/onesignal.model.dart';
import 'package:bluechip/app/models/signal.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference signalsRef = FirebaseFirestore.instance.collection("signals");

  Stream<Iterable<SignalModel>> findAll(userId) {
    return signalsRef
        .doc("forex")
        .collection("signal")
        .get()
        .then((value) {
      return value.docs.map((e) => SignalModel.fromDocumentSnapshot(e)).toList();
    }).asStream();
    //Here we are converting the firebase snapshot to a stream of user todo list.
  }

  Future<SignalModel> findOne(String id) async {
    var result = await signalsRef.doc(id).get();
    return SignalModel.fromDocumentSnapshot(result);
  }

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

  Future<SignalModel> find1One(String id) async {
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
