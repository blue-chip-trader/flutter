import 'package:bluechip/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/explore/controllers/explore_controller.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class ExploreView extends GetView<ExploreController> {
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
              icon: Icon(Icons.messenger),
              onPressed: () {
                Get.toNamed("/messages");
              }),
          actions: [IconButton(icon: Icon(Icons.camera), onPressed: () {})],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: MyTheme().bcBackground,
        body: TikTokStyleFullPageScroller(
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
                        style: const TextStyle(fontSize: 48, color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,height: 200,
                    bottom: 80,
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          color: Colors.white,
                        ),Container(alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          color: Colors.white,
                        ),Container(alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                
                ],
              );
            }));
  }
}
