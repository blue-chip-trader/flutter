import 'package:bluechip/app/theme/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/explore/controllers/explore_controller.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class ExploreView extends GetView<ExploreController> {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                  padding: EdgeInsets.only(right: 20),
                  icon: SvgPicture.asset(
                    "assets/images/Message.svg",
                    height: 40,
                  ),
                  onPressed: () {
                    Get.toNamed("/messages");
                  }),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: MyTheme().bcBackground,
        body: StreamBuilder<QuerySnapshot>(
            stream: controller.posts,
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
                  contentSize: controller.pics.length,
                  swipeThreshold: 0.2,
                  // ^ the fraction of the screen needed to scroll
                  swipeVelocityThreshold: 2000,
                  // ^ the velocity threshold for smaller scrolls
                  animationDuration: const Duration(milliseconds: 200),
                  // ^ how long the animation will take
                  builder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(controller.pics[index]),
                                  fit: BoxFit.cover)),
                          child: Center(
                            child: Text(
                              "",
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
                                        "$index",
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
