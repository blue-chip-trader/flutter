import 'package:bluechip/app/modules/calendar/controllers/calendar_controller.dart';
import 'package:bluechip/app/modules/calendar/widgets/calendar_card.dart';
import 'package:bluechip/app/modules/signals_active/controllers/signals_active_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:bluechip/app/modules/ydayevents/controllers/ydayevents_controller.dart';
import 'package:intl/intl.dart';

var now = new DateTime.now();
String mydate = DateFormat.yMMMEd().format(now);

class YdayeventsView extends GetView<YdayeventsController> {
  final SignalsActiveController _controller = Get.find();
  final CalendarController _calendarController = Get.put(CalendarController());

  Stream bcevents = FirebaseFirestore.instance.collection('events').orderBy("datetime").snapshots();

  @override
  Widget build(BuildContext context) {
    DateTime yesterday = now.subtract(Duration(days: 1));
    String ydate = DateFormat.yMMMEd().format(yesterday);

    DateTime tomorrow = now.add(Duration(days: 1));
    String tdate = DateFormat.yMMMEd().format(tomorrow);
    return Column(
      
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(ydate,style: TextStyle(color: Colors.grey),),
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
              stream: bcevents,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return new ListView(
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    children:
                        snapshot.data.docs.where((element) => _calendarController.getDate(element.data()['datetime'])== ydate).map((DocumentSnapshot document) {
                  return new CalendarCard(
                    controller: _controller,
                    time: _calendarController
                        .getTime(document.data()['datetime']),
                    country: document.data()['country'],
                    previous: document.data()['previous'],
                    forecast: document.data()['forecast'],
                    actual: document.data()['actual'],
                    flag: document.data()['flag'],
                    priority: document.data()['priority'],
                    edate: _calendarController
                        .stampToDate(document.data()['datetime']),
                  );
                }).toList());
              }),
        ),
      ],
    );
  }
}
  