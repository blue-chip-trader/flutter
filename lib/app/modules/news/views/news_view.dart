import 'package:bluechip/app/modules/profile/widgets/profile_tile.dart';
import 'package:bluechip/app/presentation/blue_chip_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/news/controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
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
              actions: [
                IconButton(
                    icon: Icon(
                      BlueChipIcons.search,
                    ),
                    onPressed: () {
                      Get.toNamed('/search');
                    })
              ],
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
                ],
              ),
            ),
            body: TabBarView(
              children: [
                ListView(
                  children: [
                    NewsCard(),
                    NewsCard(),
                    NewsCard(),
                    NewsCard(),
                    NewsCard(),
                    NewsCard(),
                  ],
                ),
                ListView(
                  children: [
                    NewsCard(),
                    NewsCard(),
                    NewsCard(),
                    NewsCard(),
                    NewsCard(),
                    NewsCard(),
                  ],
                ),
                Text('Commodities'),
                Text('Indices'),
                Text('Stocks')
              ],
            )));
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/article");
      },
      child: Container(
        margin: EdgeInsets.all(5),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xFF131314),
            borderRadius: BorderRadius.all(Radius.circular(13))),
        child: Row(children: [
          Container(
            height: 120,
            width: context.mediaQuerySize.width / 3,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/news1.jpg"),
                  fit: BoxFit.cover,
                ),
                color: Color(0xFF000000),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13),
                    bottomLeft: Radius.circular(13))),
          ),
          Expanded(
            child: Container(
              height: 120,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "An shdi sduhisud hushdfyu qqqwwe bhduhdgui hdfuihnjkhyusdf huhxcyugh",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "By Bloomberg",
                        style:
                            TextStyle(color: Color(0xFF979797), fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.timer_rounded,
                        size: 15,
                        color: Color(0xFF979797),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("5 hours ago",
                          style: TextStyle(color: Color(0xFF979797), fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
