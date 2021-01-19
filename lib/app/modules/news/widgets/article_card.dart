import 'package:bluechip/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    Key key,
    this.url,
    this.title,
    this.channel,
    this.timeAgo,
    this.imageurl,
  }) : super(key: key);

  final String url;
  final String title;
  final String channel;
  final String timeAgo;
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/article', arguments: url);
      },
      child: Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageurl),
                    fit: BoxFit.cover,
                  ),
                  color: Color(0xFF000000),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "By " + channel,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      timeAgo,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    )),
                IconButton(
                  alignment: Alignment.centerRight,
                  icon: Icon(Icons.more_vert, size: 18, color: Colors.grey),
                  onPressed: () {
                    Get.bottomSheet(Container(padding: EdgeInsets.all(10),
                      decoration:
                          BoxDecoration(color: MyTheme().bcPrimaryColor2),
                      child: new Wrap(
                        children: [
                          ListTile(
                              leading: new Icon(Icons.bookmark_border,
                                  size: 20, color: Colors.grey[200]),
                              title: new Text(
                                'Save for later',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey[200]),
                              ),
                              onTap: () => {Get.back()}),
                          ListTile(
                            leading: new Icon(Icons.share_outlined,
                                  size: 20, color: Colors.grey[200]),
                            title: new Text('Share',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey[200]),),
                            onTap: () => {
                              Get.back()
                            },
                          ),
                          ListTile(
                              leading: new Icon(Icons.link,
                                  size: 20, color: Colors.grey[200]),
                              title: new Text('Go to ${channel}',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey[200]),),
                              onTap: () => {Get.back()}),
                          ListTile(
                            leading: new Icon(Icons.feedback,
                                  size: 20, color: Colors.grey[200]),
                            title: new Text('Send feedback',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey[200]),),
                            onTap: () => {Get.back()},
                          ),
                          ListTile(
                            leading: new Icon(Icons.flag,
                                  size: 20, color: Colors.grey[200]),
                            title: new Text('Report content',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey[200]),),
                            onTap: () => {Get.back()},
                          ),
                        ],
                      ),
                    ));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
