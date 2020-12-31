import 'package:bluechip/app/modules/signals_active/controllers/signals_active_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ClosedSignalCard extends StatelessWidget {
  const ClosedSignalCard(
      {Key key,
      @required this.controller,
      this.pair,
      this.price,
      this.sl,
      this.tp,
      this.won,
      this.myindex, this.date, this.flag1, this.flag2})
      : super(key: key);

  final SignalsActiveController controller;
  final String pair, price, tp, sl, myindex,date,flag1,flag2;
  final bool won;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/signal", arguments: myindex);
      },
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
          padding: new EdgeInsets.all(10.0),
          width: double.infinity,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Color(0xFF131314),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.network(
                        controller.flags["usFlag"],
                        height: 11.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SvgPicture.network(
                        controller.flags["zaFlag"],
                        height: 11.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(pair,
                      style: TextStyle(fontSize: 11,)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(price,
                      style: TextStyle(fontSize: 11,))
                ],
              ),
              
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (won == true)
                      ? Container(
                          alignment: Alignment.center,
                          child: Text("WON",
                              style: TextStyle(
                                  fontSize: 11,)),
                          padding: EdgeInsets.all(5),
                          width: 80,
                          decoration: BoxDecoration(
                              color: Color(0xFF2A4236),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        )
                      : Container(
                          alignment: Alignment.center,
                          child: Text("LOST",
                              style: TextStyle(
                                  fontSize: 11,)),
                          padding: EdgeInsets.all(5),
                          width: 80,
                          decoration: BoxDecoration(
                              color: Color(0xFF782427),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(tp,
                      style: TextStyle(fontSize: 13,)),
                ],
              )
            ],
          ),
        ),
        Align(
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF1C1C1F),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))),
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            margin: EdgeInsets.all(10.0),
            child: Text(date),
          ),
        )
      ]),
    );
  }
}
