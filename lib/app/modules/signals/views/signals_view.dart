import 'package:bluechip/app/modules/home/home_controller.dart';
import 'package:bluechip/app/modules/notifications/views/notifications_view.dart';
import 'package:bluechip/app/modules/signals_active/views/signals_active_view.dart';
import 'package:bluechip/app/modules/signals_history/views/signals_history_view.dart';
import 'package:bluechip/app/presentation/blue_chip_icons_icons.dart';
import 'package:bluechip/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/signals/controllers/signals_controller.dart';
import 'package:get_storage/get_storage.dart';

class SignalsView extends GetView<SignalsController> {
  HomeController _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final appData = GetStorage();
    bool _isDarkMode = appData.read("_isDark");
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: _isDarkMode
                ? MyTheme().bcBackground
                : MyThemeLight().bcBackground,
            appBar: AppBar(
              // title: Image.asset(
              //   'assets/images/bclogo.png',
              //   height: 20,
              // ),
              title: Text("Signals"),
              centerTitle: true,
              actions: [
                IconButton(
                    icon: Icon(
                      BlueChipIcons.notification,
                    ),
                    onPressed: () {
                      _homeController.removeDot();
                      Get.toNamed('/notifications');
                    })
              ],
              backgroundColor: _isDarkMode
                  ? MyTheme().bcAppBarColor
                  : MyThemeLight().bcAppBarColor,
              elevation: 5,
              bottom: TabBar(
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2.0, color: Colors.white),
                    insets: EdgeInsets.symmetric(horizontal: 30.0)),
                tabs: [
                  Tab(icon: Text('Active')),
                  Tab(icon: Text('This Week')),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                SignalsActiveView(),
                SignalsHistoryView(),
              ],
            )));
  }
}
