import 'package:bluechip/app/presentation/blue_chip_icons_icons.dart';
import 'package:bluechip/app/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    Key key,
    this.ptitle,
    this.psubtitle,
    this.ppage,
    this.picon,
  }) : super(key: key);

  final String ptitle, psubtitle, ppage;
  final IconData picon;

  @override
  Widget build(BuildContext context) {
    final appData = GetStorage();
    bool _isDarkMode = appData.read("_isDark");
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
            color: _isDarkMode
                                ? MyTheme().bcPrimaryColor2
                                : MyThemeLight().bcPrimaryColor2,
            borderRadius: BorderRadius.circular(100)),
        child: new IconButton(
            icon: new Icon(
          picon,
          color: _isDarkMode
                                ? MyTheme().bcIcons
                                : MyThemeLight().bcIcons,
        )),
      ),
      title: Text(ptitle),
      subtitle: Text(psubtitle, style: TextStyle(fontSize: 12)),
      trailing: Icon(BlueChipIcons.arrow___right_circle,color: _isDarkMode
                                ? MyTheme().bcIcons
                                : MyThemeLight().bcIcons,),
      onTap: () {
        Get.toNamed(ppage);
      },
    );
  }
}

class Profile2Tile extends StatelessWidget {
  const Profile2Tile({
    Key key,
    this.ptitle,
    this.ppage,
    this.picon,
  }) : super(key: key);

  final String ptitle, ppage;
  final IconData picon;

  @override
  Widget build(BuildContext context) {
    final appData = GetStorage();
    bool _isDarkMode = appData.read("_isDark");
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
            color: _isDarkMode
                                ? MyTheme().bcPrimaryColor2
                                : MyThemeLight().bcPrimaryColor2,
            borderRadius: BorderRadius.circular(100)),
        child: new IconButton(
            icon: new Icon(
          picon,
          color: _isDarkMode
                                ? MyTheme().bcIcons
                                : MyThemeLight().bcIcons,
        )),
      ),
      title: Text(ptitle),
      trailing: Icon(BlueChipIcons.arrow___right_circle,color: _isDarkMode
                                ? MyTheme().bcIcons
                                : MyThemeLight().bcIcons,),
      onTap: () {
        Get.toNamed(ppage);
        if (auth.currentUser != null) {
          print("still logged in, Code: " + auth.currentUser.uid);
        }
        print("loggedout");
      },
    );
  }
}
