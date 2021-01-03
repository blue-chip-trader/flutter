import 'package:bluechip/app/modules/calendar/widgets/calendar_card.dart';
import 'package:bluechip/app/modules/signals_active/controllers/signals_active_controller.dart';
import 'package:bluechip/app/presentation/blue_chip_icons_icons.dart';
import 'package:bluechip/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/calendar/controllers/calendar_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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

    var now = new DateTime.now();
    String date = DateFormat.yMMMEd().format(now);

    DateTime yesterday = now.subtract(Duration(days: 1));
    String ydate = DateFormat.yMMMEd().format(yesterday);

    DateTime tomorrow = now.add(Duration(days: 1));
    String tdate = DateFormat.yMMMEd().format(tomorrow);

    return DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(
            backgroundColor: isDarkMode
                ? MyTheme().bcBackground
                : MyThemeLight().bcBackground,
            appBar: AppBar(
              // title: Image.asset(
              //   'assets/images/bclogo.png',
              //   height: 20,
              // ),
              title: Text("Economic Calendar"),
              centerTitle: true,
              actions: [],
              backgroundColor: isDarkMode
                  ? MyTheme().bcAppBarColor
                  : MyThemeLight().bcAppBarColor,
              elevation: 5,
              bottom: TabBar(
                isScrollable: true,
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2.0, color: Colors.white),
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
                CalendarList(
                  date: ydate.toString(),
                ),
                CalendarList(
                  date: date.toString(),
                ),
                CalendarList(
                  date: tdate.toString(),
                ),
                CalendarList(
                  date: "From 7 - 8 Jan 2021",
                ),
              ],
            )));
  }
}

class CalendarList extends StatelessWidget {
  final SignalsActiveController _controller =
      Get.put(SignalsActiveController());
  final String date;

  CalendarList({Key key, this.date}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("pull up load");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("release to load more");
          } else {
            body = Text("No more Data");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              date,
              style: TextStyle(color: Color(0xFF4B4B4B), fontSize: 15),
            ),
          )),
          CalendarCard(
            controller: _controller,
            time: "14:30",
            country: "S.Africa",
            previous: "10%",
            forecast: "11%",
            actual: "8%",
            flag: "zaFlag",
          ),
          CalendarCard(
            controller: _controller,
            time: "14:30",
            country: "USA",
            previous: "10%",
            forecast: "11%",
            actual: "8%",
            flag: "usFlag",
          ),
          CalendarCard(
            controller: _controller,
            time: "14:30",
            country: "S.Africa",
            previous: "10%",
            forecast: "11%",
            actual: "8%",
            flag: "zaFlag",
          ),
          CalendarCard(
            controller: _controller,
            time: "14:30",
            country: "Japan",
            previous: "10%",
            forecast: "11%",
            actual: "8%",
            flag: "jpFlag",
          ),
          CalendarCard(
            controller: _controller,
            time: "14:30",
            country: "S.Africa",
            previous: "10%",
            forecast: "11%",
            actual: "8%",
            flag: "zaFlag",
          ),
          CalendarCard(
            controller: _controller,
            time: "14:30",
            country: "S.Africa",
            previous: "10%",
            forecast: "11%",
            actual: "8%",
            flag: "zaFlag",
          ),
          CalendarCard(
            controller: _controller,
            time: "14:30",
            country: "S.Africa",
            previous: "10%",
            forecast: "11%",
            actual: "8%",
            flag: "zaFlag",
          )
        ],
      ),
    );
  }
}
