import 'package:bluechip/app/presentation/blue_chip_icons_icons.dart';
import 'package:bluechip/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/article/controllers/article_controller.dart';

class ArticleView extends GetView<ArticleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme().bcPrimaryColor,
        appBar: AppBar(
          title: Text("Commodities"),
          centerTitle: true,
          backgroundColor: MyTheme().bcPrimaryColor,
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  "Oil Starts 2021 Lower On OPEC, COVID Worries",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "By Investing.com - 2 hrs ago",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        children: [
                          
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 20,
                            width: 20,
                            child: Icon(BlueChipIcons.facebook_logo,size: 20,),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 20,
                            width: 20,
                            child: Icon(BlueChipIcons.twitter,size: 20,),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            child: Icon(BlueChipIcons.whatsapp,size: 20,),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                      height: 250,
                      child: Image.network(
                        "https://i-invdn-com.akamaized.net/news/LYNXNPEAB10O6_L.jpg",
                        fit: BoxFit.cover,
                      ),
                      decoration: BoxDecoration(
                          color: MyTheme().bcPrimaryColor2,
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Investing.com -  After ending the worst year in oil trading down 21%, crude prices began 2021 on a weak note as well, hampered by worries about rising production in a world where demand for fuels remained suspect from the protracted coronavirus crisis",
                  style: TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Center(
                            child: Text(
                          "Link",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            color: MyTheme().bcButtonColor,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "More Stories",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(children: [
                            Container(
                              height: 150,
                              width: 150,
                              color: Colors.blue,
                              child: Image.network(
                                "https://i-invdn-com.akamaized.net/news/LYNXNPEAB10O6_L.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 5,
                              child: Container(
                                  width: 150,
                                  child: Text(
                                    "Another news article that is going to elipse",
                                    overflow: TextOverflow.ellipsis,
                                  )),
                            )
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 150,
                            width: 150,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 150,
                            width: 150,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 150,
                            width: 150,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
