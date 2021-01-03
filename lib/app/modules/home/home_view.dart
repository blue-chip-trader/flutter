import 'package:bluechip/app/modules/calendar/views/calendar_view.dart';
import 'package:bluechip/app/modules/explore/views/explore_view.dart';
import 'package:bluechip/app/modules/news/views/news_view.dart';
import 'package:bluechip/app/modules/profile/views/profile_view.dart';
import 'package:bluechip/app/modules/signal/controllers/signal_controller.dart';
import 'package:bluechip/app/modules/signals/views/signals_view.dart';
import 'package:bluechip/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/home/home_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:bluechip/app/presentation/blue_chip_icons_icons.dart';

PersistentTabController _controller = PersistentTabController(initialIndex: 0);
final HomeController cnofits = Get.put(HomeController());

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final appData = GetStorage();
    bool _isDarkMode = appData.read("_isDark");
    return SimpleBuilder(builder: (_) {
      return PersistentTabView(
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: MyTheme().bcNavBarColor,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears.
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
        decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(0),
            colorBehindNavBar: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
              )
            ]),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style12, // Choose the nav bar style with this property.
      );
    });
  }
}

List<Widget> _buildScreens() {
  return [
    SignalsView(),
    CalendarView(),
    ExploreView(),
    NewsView(),
    ProfileView()
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
        icon: Center(
          child: Stack(
            children: [
              Icon(BlueChipIcons.home),
              Obx(() {
                if (cnofits.notifs == true) {
                  return NotifDot(color: Colors.red,);
                } else {
                  return NotifDot(color: MyTheme().bcNavBarColor,);
                }
              })
            ],
          ),
        ),
        title: ("Home"),
        activeColor: MyTheme().bcActiveNavIcon,
        inactiveColor: MyTheme().bcInactiveNavIcon,
        titleFontSize: 8),
    PersistentBottomNavBarItem(
        icon: Icon(BlueChipIcons.calendar),
        title: ("Calendar"),
        activeColor: MyTheme().bcActiveNavIcon,
        inactiveColor: MyTheme().bcInactiveNavIcon,
        titleFontSize: 8),
    PersistentBottomNavBarItem(
        icon: Stack(children: [
          Image(
            image: AssetImage("assets/images/bcico.png"),
          ),
          NotifDot()
        ]),
        title: ("Explore"),
        activeColor: MyTheme().bcActiveNavIcon,
        inactiveColor: MyTheme().bcInactiveNavIcon,
        titleFontSize: 8),
    PersistentBottomNavBarItem(
        icon: Center(
          child: Stack(
            children: [
              Icon(BlueChipIcons.news),
            ],
          ),
        ),
        title: ("News"),
        activeColor: MyTheme().bcActiveNavIcon,
        inactiveColor: MyTheme().bcInactiveNavIcon,
        titleFontSize: 8),
    PersistentBottomNavBarItem(
        icon: Icon(BlueChipIcons.more),
        title: ("More"),
        activeColor: MyTheme().bcActiveNavIcon,
        inactiveColor: MyTheme().bcInactiveNavIcon,
        titleFontSize: 8),
  ];
}

class NotifDot extends StatelessWidget {
  const NotifDot({
    Key key, this.color,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 6,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(20)),
    );
  }
}
