import 'package:bluechip/app/models/signal.model.dart';
import 'package:bluechip/app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignalsActiveController extends GetxController {
  //TODO: Implement SignalsActiveController
  SignalModel activeSignal;
  Database _database;
  int usersub;
  String uid = FirebaseAuth.instance.currentUser.uid.toString();

  Rx<List<SignalModel>> signalsList = Rx<List<SignalModel>>();

  List<SignalModel> get signals => signalsList.value;

  Future<SignalModel> loadDetails(String id) async {
    try {
      activeSignal = await _database.findOne(id);
      print(activeSignal);

      return activeSignal;
    } catch (e) {}
  }

  final count = 0.obs;

  Stream signalsActive = FirebaseFirestore.instance
      .collection('signals')
      .doc('forex')
      .collection("signal")
      .orderBy("opened at", descending: true)
      .snapshots();

  var flags = {
    'usFlag':
        'https://firebasestorage.googleapis.com/v0/b/blue-chip-trader.appspot.com/o/US.svg?alt=media&token=06b84ebb-2871-49a3-a876-b02e707e005d',
    'zaFlag':
        'https://firebasestorage.googleapis.com/v0/b/blue-chip-trader.appspot.com/o/ZA.svg?alt=media&token=cd4e6a45-fda5-4464-82bd-42ccf239c046',
    'jpFlag':
        'https://firebasestorage.googleapis.com/v0/b/blue-chip-trader.appspot.com/o/JP.svg?alt=media&token=bcb90d09-1c93-4cd0-9da8-6b9e48c09013',
    'auFlag':
        'https://firebasestorage.googleapis.com/v0/b/blue-chip-trader.appspot.com/o/AU.svg?alt=media&token=e7230ee4-0001-48ac-be13-df8e964a7ea9',
    'caFlag':
        'https://firebasestorage.googleapis.com/v0/b/blue-chip-trader.appspot.com/o/CA.svg?alt=media&token=97075720-6e74-4756-a752-c84e243ea584',
    'gbFlag':
        'https://firebasestorage.googleapis.com/v0/b/blue-chip-trader.appspot.com/o/GB.svg?alt=media&token=aee1ab81-c1d9-492d-8217-8b1dfc8cc6cf',
    'euFlag':
        'https://firebasestorage.googleapis.com/v0/b/blue-chip-trader.appspot.com/o/EU.svg?alt=media&token=79593e95-9212-49a5-a96c-3a43c1249150',
    'nzFlag':
        'https://firebasestorage.googleapis.com/v0/b/blue-chip-trader.appspot.com/o/NZ.svg?alt=media&token=e6354b2a-7b15-4aef-b84d-3b738a33eae4',
    'chFlag':
        'https://firebasestorage.googleapis.com/v0/b/blue-chip-trader.appspot.com/o/CH.svg?alt=media&token=0cc92f17-c117-47c3-88f2-f64584602f96',
    'cnFlag':
        'https://firebasestorage.googleapis.com/v0/b/blue-chip-trader.appspot.com/o/CN.svg?alt=media&token=f8d575ef-acc0-4a06-8122-b02a1e96d1e7'
  };

  var countryFlags = {};

  @override
  void onInit() {
    signalsList
        .bindStream(Database().signalStream()); //stream coming from firebase

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot doc) => {usersub = doc['subscription']});
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;
}
