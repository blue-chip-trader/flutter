import 'package:bluechip/app/modules/news/controllers/news_controller.dart';
import 'package:bluechip/app/modules/news/widgets/article_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

NewsController controller = Get.put(NewsController());

class ForexNews extends StatefulWidget {
  @override
  _ForexNewsState createState() => _ForexNewsState();
}

class _ForexNewsState extends State<ForexNews>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: controller.article,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return new ListView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: snapshot.data.docs
                  .where((element) => element["category"] == "forex")
                  .map((DocumentSnapshot document) {
                return new ArticleCard(
                  title: document.data()['title'],
                  url: document.data()['url'],
                  imageurl: document.data()['imageurl'],
                  timeAgo: document.data()['time'],
                  channel: document.data()['channel'],
                );
              }).toList());
        });
  }

  @override
  bool get wantKeepAlive => true;
}
