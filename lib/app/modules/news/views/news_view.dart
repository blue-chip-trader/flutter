import 'package:bluechip/app/modules/news/widgets/forex_feed.dart';
import 'package:bluechip/app/modules/news/widgets/popular_feed.dart';
import 'package:bluechip/app/modules/popfeed/views/popfeed_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/news/controllers/news_controller.dart';


class NewsView extends GetView<NewsController> {
  final NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        initialIndex: 1,
        child: Scaffold(
            backgroundColor: Color(0xFF000000),
            appBar: AppBar(
              // title: Image.asset(
              //   'assets/images/bclogo.png',
              //   height: 20,
              // ),
              title: Text("News"),
              centerTitle: true,
              //

              backgroundColor: Color(0xFF0E0E0F),
              elevation: 5,
              bottom: TabBar(
                isScrollable: true,
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2.0, color: Colors.white),
                    insets: EdgeInsets.symmetric(horizontal: 30.0)),
                tabs: [
                  Tab(icon: Text('Popular')),
                  Tab(icon: Text('Forex')),
                  Tab(icon: Text('Commodities')),
                  Tab(icon: Text('Indices')),
                  Tab(icon: Text('Stocks')),
                  Tab(icon: Text('Technology')),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                PopularFeed1(),
                ForexNews(),
                ForexNews(),
                ForexNews(),
                PopularFeed(),
                PopularFeed(),
              ],
            )));
  }
}
