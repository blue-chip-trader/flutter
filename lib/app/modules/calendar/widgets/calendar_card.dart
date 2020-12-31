import 'package:bluechip/app/modules/signals_active/controllers/signals_active_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CalendarCard extends StatelessWidget {
  const CalendarCard({
    Key key,
    @required SignalsActiveController controller,
    this.time,
    this.country,
    this.previous,
    this.forecast,
    this.actual,
    this.flag,
  })  : _controller = controller,
        super(key: key);

  final SignalsActiveController _controller;
  final String time, country, previous, forecast, actual, flag;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.all(10),
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xFF131314), borderRadius: BorderRadius.circular(13)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 60,
                child: Row(
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(time, style: TextStyle(fontSize: 11))
                  ],
                ),
              ),
              Container(
                width: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.network(
                      _controller.flags[flag],
                      height: 11.0,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(country, style: TextStyle(fontSize: 11))
                  ],
                ),
              ),
              Container(
                  width: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ],
                  ))
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              "Monetary Policy Meeting Minutes",
              style: TextStyle(color: Color(0xFFDADADA),fontSize: 10),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Previous", style: TextStyle(fontSize: 10)),
                    Text(previous, style: TextStyle(fontSize: 14))
                  ],
                ),
                Column(
                  children: [
                    Text("Forecast", style: TextStyle(fontSize: 10)),
                    Text(forecast, style: TextStyle(fontSize: 14))
                  ],
                ),
                Column(
                  children: [
                    Text("Actual", style: TextStyle(fontSize: 10)),
                    Text(actual, style: TextStyle(fontSize: 14))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
