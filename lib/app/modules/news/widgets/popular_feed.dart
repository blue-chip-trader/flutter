import 'package:bluechip/app/modules/news/controllers/news_controller.dart';
import 'package:bluechip/app/modules/news/widgets/article_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

NewsController controller = Get.put(NewsController());
Stream article = FirebaseFirestore.instance.collection('news').snapshots();


class PopularFeed extends StatefulWidget {
  @override
  _PopularFeedState createState() => _PopularFeedState();
}

class _PopularFeedState extends State<PopularFeed>
    with AutomaticKeepAliveClientMixin {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: article,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {}

          if (snapshot.connectionState == ConnectionState.waiting) {}

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
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  children: snapshot.data.docs
                      .where((element) => element["category"] == "popular")
                      .map((DocumentSnapshot document) {
                    return new ArticleCard(
                      title: document.data()['title'],
                      url: document.data()['url'],
                      imageurl: document.data()['imageurl'],
                      timeAgo: document.data()['time'],
                      channel: document.data()['channel'],
                    );
                  }).toList()));
          ;
        });
  }

  @override
  bool get wantKeepAlive => true;
}
