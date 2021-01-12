import 'package:bluechip/app/theme/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/explore/controllers/explore_controller.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class ExploreView extends GetView<ExploreController> {
  Stream posts = FirebaseFirestore.instance
      .collection("posts")
      .orderBy("created", descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = <Color>[
      Colors.red,
      Colors.blue,
      Colors.yellow,
      Colors.red,
      Colors.blue,
      Colors.yellow
    ];
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
              padding: EdgeInsets.only(left: 20),
              icon: SvgPicture.asset(
                "assets/images/Message.svg",
                height: 30,
              ),
              onPressed: () {
                Get.toNamed("/messages");
              }),
          actions: [
            IconButton(
                icon: SvgPicture.asset(
                  "assets/images/Camera.svg",
                  height: 30,
                ),
                padding: EdgeInsets.only(right: 15),
                onPressed: () {})
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: MyTheme().bcBackground,
        body: StreamBuilder<QuerySnapshot>(
            stream: posts,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              return new TikTokStyleFullPageScroller(
                  contentSize: colors.length,
                  swipeThreshold: 0.2,
                  // ^ the fraction of the screen needed to scroll
                  swipeVelocityThreshold: 2000,
                  // ^ the velocity threshold for smaller scrolls
                  animationDuration: const Duration(milliseconds: 200),
                  // ^ how long the animation will take
                  builder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Container(
                          color: colors[index],
                          child: Center(
                            child: Text(
                              '$index',
                              style: const TextStyle(
                                  fontSize: 48, color: Colors.white),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          height: 170,
                          bottom: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/Heart.svg",
                                        height: 30,
                                      ),
                                      Text(
                                        "400",
                                      ),
                                    ],
                                  )),
                              Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/Chat.svg",
                                        height: 30,
                                      ),
                                      Text("26"),
                                    ],
                                  )),
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 50,
                                child: SvgPicture.asset(
                                  "assets/images/Square.svg",
                                  height: 30,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  });
            }));
  }
}
