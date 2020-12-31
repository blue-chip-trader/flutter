import 'package:bluechip/app/modules/signals_active/controllers/signals_active_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {Key key,
      @required this.controller,
      this.pair,
      this.price,
      this.sl,
      this.tp,
      this.buy,
      this.myindex})
      : super(key: key);

  final SignalsActiveController controller;
  final String pair, price, tp, sl, myindex;
  final bool buy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/signal", arguments: myindex);
      },
      child: Container(
        padding: new EdgeInsets.all(10.0),
        width: double.infinity,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Color(0xFF2A2B32),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              
              children: [
                Row(
                  children: [
                    SvgPicture.network(
                      controller.flags["usFlag"],
                      height: 14.0,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.network(
                      controller.flags["zaFlag"],
                      height: 14.0,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(pair,
                    style: TextStyle(fontSize: 12, color: Color(0xFFDADADA))),
                SizedBox(
                  height: 15,
                ),
                (buy == true)
                    ? Container(
                        alignment: Alignment.center,
                        child: VxShimmer(
                                                  child: Text("BUY",
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 11, color: Color(0xFFDADADA))),
                        ),
                        padding: EdgeInsets.all(5),
                        width: 80,
                        decoration: BoxDecoration(
                            color: Color(0xFF2A4236),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      )
                    : Container(
                        alignment: Alignment.center,
                        child: VxShimmer(
                                                  child: Text("SELL",
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 11, color: Color(0xFFDADADA))),
                        ),
                        padding: EdgeInsets.all(5),
                        width: 80,
                        decoration: BoxDecoration(
                            color: Color(0xFF782427),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: Text("Open"),
              height: 70,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Color(0xFF373842),
              ),
            )
          ],
        ),
      ),
    );
  }
}
