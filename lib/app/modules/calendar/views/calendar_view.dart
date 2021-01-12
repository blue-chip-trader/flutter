import 'package:bluechip/app/modules/calendar/widgets/calendar_card.dart';
import 'package:bluechip/app/modules/signals_active/controllers/signals_active_controller.dart';
import 'package:bluechip/app/modules/thisweekevents/views/thisweekevents_view.dart';
import 'package:bluechip/app/modules/todayevents/views/todayevents_view.dart';
import 'package:bluechip/app/modules/tomoroevents/views/tomoroevents_view.dart';
import 'package:bluechip/app/modules/ydayevents/views/ydayevents_view.dart';
import 'package:bluechip/app/presentation/blue_chip_icons_icons.dart';
import 'package:bluechip/app/theme/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/calendar/controllers/calendar_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

var now = new DateTime.now();
String mydate = DateFormat.yMMMEd().format(now);
RefreshController _refreshController = RefreshController(initialRefresh: false);

void _onRefresh() async {
  // monitor network fetch
  await Future.delayed(Duration(milliseconds: 1000));
  // if failed,use refreshFailed()
  _refreshController.refreshCompleted();
}

void _onLoading() async {
  // monitor network fetch
  await Future.delayed(Duration(milliseconds: 1000));
  // if failed,use loadFailed(),if no data return,use LoadNodata()

  _refreshController.loadComplete();
}

class CalendarView extends GetView<CalendarController> {
  @override
  Widget build(BuildContext context) {
    final appData = GetStorage();
    bool isDarkMode = appData.read("_isDark");

    DateTime yesterday = now.subtract(Duration(days: 1));
    String ydate = DateFormat.yMMMEd().format(yesterday);

    DateTime tomorrow = now.add(Duration(days: 1));
    String tdate = DateFormat.yMMMEd().format(tomorrow);
    Stream events = FirebaseFirestore.instance.collection('events').snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: events,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return DefaultTabController(
              length: 4,
              initialIndex: 1,
              child: Scaffold(
                  backgroundColor: MyTheme().bcBackground,
                  appBar: AppBar(
                    title: Text("Economic Calendar"),
                    centerTitle: true,
                    actions: [],
                    backgroundColor: MyTheme().bcAppBarColor,
                    elevation: 5,
                    bottom: TabBar(
                      isScrollable: true,
                      indicator: UnderlineTabIndicator(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.white),
                          insets: EdgeInsets.symmetric(horizontal: 30.0)),
                      tabs: [
                        Tab(icon: Text('Yesterday')),
                        Tab(icon: Text('Today')),
                        Tab(icon: Text('Tomorrow')),
                        Tab(icon: Text('This Week')),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      YdayeventsView(),
                      TodayeventsView(),
                      TomoroeventsView(),
                      ThisweekeventsView(),
                    ],
                  )));
        });
  }
}

class CalendarList extends StatelessWidget {
  final SignalsActiveController _controller =
      Get.put(SignalsActiveController());
  final String today;

  CalendarList({
    Key key,
    this.today,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Stream events = FirebaseFirestore.instance.collection('events').snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: events,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // return ListView(
          //   children: snapshot.data.docs.map((DocumentSnapshot document) {
          //     print(getDate(document.data()['datetime']));

          //     if (getDate(document.data()['datetime']) == today)
          //       return CalendarCard(
          //         controller: _controller,
          //         time: getTime(document.data()['datetime']),
          //         country: document.data()['country'],
          //         previous: document.data()['previous'],
          //         forecast: document.data()['forecast'],
          //         actual: document.data()['actual'],
          //         flag: document.data()['flag'],
          //         priority: document.data()['priority'],
          //         edate: stampToDate(document.data()['datetime']),
          //       );
          //   }).toList(),
          // );

          // return SmartRefresher(
          //   enablePullDown: true,
          //   enablePullUp: true,
          //   header: WaterDropHeader(),
          //   footer: CustomFooter(
          //     builder: (BuildContext context, LoadStatus mode) {
          //       Widget body;
          //       if (mode == LoadStatus.idle) {
          //         body = Text("pull up load");
          //       } else if (mode == LoadStatus.loading) {
          //         body = CupertinoActivityIndicator();
          //       } else if (mode == LoadStatus.failed) {
          //         body = Text("Load Failed!Click retry!");
          //       } else if (mode == LoadStatus.canLoading) {
          //         body = Text("release to load more");
          //       } else {
          //         body = Text("No more Data");
          //       }
          //       return Container(
          //         height: 55.0,
          //         child: Center(child: body),
          //       );
          //     },
          //   ),
          //   controller: _refreshController,
          //   onRefresh: _onRefresh,
          //   onLoading: _onLoading,
          //   child: ListView(
          //     physics: ClampingScrollPhysics(),
          //     children: [
          //       Center(
          //           child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Text(
          //           date,
          //           style: TextStyle(color: Color(0xFF4B4B4B), fontSize: 15),
          //         ),
          //       )),
          //       CalendarCard(
          //         controller: _controller,
          //         time: "14:30",
          //         country: "S.Africa",
          //         previous: "10%",
          //         forecast: "11%",
          //         actual: "8%",
          //         flag: "zaFlag",
          //       ),
          //       CalendarCard(
          //         controller: _controller,
          //         time: "14:30",
          //         country: "USA",
          //         previous: "10%",
          //         forecast: "11%",
          //         actual: "8%",
          //         flag: "usFlag",
          //       ),
          //       CalendarCard(
          //         controller: _controller,
          //         time: "14:30",
          //         country: "S.Africa",
          //         previous: "10%",
          //         forecast: "11%",
          //         actual: "8%",
          //         flag: "zaFlag",
          //       ),
          //       CalendarCard(
          //         controller: _controller,
          //         time: "14:30",
          //         country: "Japan",
          //         previous: "10%",
          //         forecast: "11%",
          //         actual: "8%",
          //         flag: "jpFlag",
          //       ),
          //       CalendarCard(
          //         controller: _controller,
          //         time: "14:30",
          //         country: "S.Africa",
          //         previous: "10%",
          //         forecast: "11%",
          //         actual: "8%",
          //         flag: "zaFlag",
          //       ),
          //       CalendarCard(
          //         controller: _controller,
          //         time: "14:30",
          //         country: "S.Africa",
          //         previous: "10%",
          //         forecast: "11%",
          //         actual: "8%",
          //         flag: "zaFlag",
          //       ),
          //       CalendarCard(
          //         controller: _controller,
          //         time: "14:30",
          //         country: "S.Africa",
          //         previous: "10%",
          //         forecast: "11%",
          //         actual: "8%",
          //         flag: "zaFlag",
          //       )
          //     ],
          //   ),
          // );
        });
  }
}
