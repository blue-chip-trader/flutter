import 'package:bluechip/app/modules/auth/controllers/auth_controller.dart';
import 'package:bluechip/app/modules/profile/widgets/profile_tile.dart';
import 'package:bluechip/app/presentation/blue_chip_icons_icons.dart';
import 'package:bluechip/app/theme/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/profile/controllers/profile_controller.dart';
import 'package:get_storage/get_storage.dart';

AuthController _authcontroller = Get.put(AuthController());

User user = FirebaseAuth.instance.currentUser;

class ProfileView extends GetView<ProfileController> {
  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final appData = GetStorage();
    bool _isDarkMode = appData.read("_isDark");
    String uid = FirebaseAuth.instance.currentUser.uid.toString();
        CollectionReference users = FirebaseFirestore.instance.collection('users');


    return Scaffold(
        backgroundColor:
            _isDarkMode ? MyTheme().bcBackground : MyThemeLight().bcBackground,
        appBar: AppBar(
          // title: Image.asset(
          //   'assets/images/bclogo.png',
          //   height: 20,
          // ),
          title: Text("More"),
          centerTitle: true,
          backgroundColor: _isDarkMode
              ? MyTheme().bcAppBarColor
              : MyThemeLight().bcAppBarColor,
        ),
        body: GetBuilder<ProfileController>(builder: (value) {
          return FutureBuilder(
              future: users.doc(uid).get(),
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  Map<String, dynamic> data = snapshot.data.data();

                  return Center(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.all(15),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: _isDarkMode
                                      ? MyTheme().bcPrimaryColor
                                      : MyThemeLight().bcPrimaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              child: Column(children: [
                                
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(200),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(
                                      "https://simplyilm.com/wp-content/uploads/2017/08/temporary-profile-placeholder-1.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                    decoration: BoxDecoration(
                                        color: MyTheme().bcBackground,
                                        borderRadius:
                                            BorderRadius.circular(200)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(data['dname']),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(data['email']),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(data['phone']),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed("/confirmdetails");
                                  },
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                      "Edit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                    height: 30,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: MyTheme().bcButtonColor,
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                ),
                              ])),
                          Container(
                              margin: EdgeInsets.all(15),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: _isDarkMode
                                      ? MyTheme().bcPrimaryColor
                                      : MyThemeLight().bcPrimaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              child: Column(children: [
                                ProfileTile(
                                  ptitle: "Subscriptions",
                                  picon: BlueChipIcons.ticket,
                                  psubtitle: data['subscription'],
                                  ppage: "/settings-subscription",
                                ),
                                ProfileTile(
                                  ptitle: "Notifications",
                                  picon: BlueChipIcons.notification,
                                  psubtitle: "signals, events, news",
                                  ppage: "/settings-notifications",
                                ),
                                ListTile(
                                  leading: Container(
                                    decoration: BoxDecoration(
                                        color: _isDarkMode
                                            ? MyTheme().bcPrimaryColor2
                                            : MyThemeLight().bcPrimaryColor2,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: new IconButton(
                                        icon: new Icon(
                                      BlueChipIcons.setting,
                                      color: MyTheme().bcIcons,
                                    )),
                                  ),
                                  title: Text("Theme"),
                                  subtitle: Text("Dark"),
                                  trailing: Transform.scale(
                                    alignment: Alignment.centerRight,
                                    scale: 0.8,
                                    child: ValueBuilder<bool>(
                                        initialValue: _isDarkMode,
                                        builder: (_isDarkmode, updateFn) =>
                                            CupertinoSwitch(
                                                value: _isDarkMode,
                                                activeColor: Colors.black,
                                                trackColor:
                                                    MyTheme().bcButtonColor,
                                                onChanged: updateFn),
                                        onUpdate: (value) {
                                          Get.snackbar('Under Construction',
                                              'on our next update you will be able to change your theme to Light mode.');
                                          // appData.write("_isDark", value);
                                          // Get.changeTheme(Get.isDarkMode
                                          //     ? ThemeData.light()
                                          //     : ThemeData.dark());
                                        }),
                                  ),
                                ),
                              ])),
                          Container(
                            margin: EdgeInsets.all(15),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: _isDarkMode
                                    ? MyTheme().bcPrimaryColor
                                    : MyThemeLight().bcPrimaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13))),
                            child: Column(children: [
                              Profile2Tile(
                                ptitle: "How it works",
                                picon: BlueChipIcons.info,
                                ppage: "/settings-howitworks",
                              ),
                              Profile2Tile(
                                ptitle: "Books",
                                picon: BlueChipIcons.book_open,
                                ppage: "/settings-books",
                              ),
                              Profile2Tile(
                                ptitle: "About Us",
                                picon: BlueChipIcons.work,
                                ppage: "/settings-about",
                              ),
                              Profile2Tile(
                                ptitle: "Support & Feedback",
                                picon: BlueChipIcons.chat_1,
                                ppage: "/settings-support",
                              ),
                            ]),
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: _isDarkMode
                                    ? MyTheme().bcPrimaryColor
                                    : MyThemeLight().bcPrimaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13))),
                            child: Column(children: [
                              Profile2Tile(
                                ptitle: "FAQs",
                                picon: BlueChipIcons.info,
                                ppage: "/settings-howitworks",
                              ),
                              Profile2Tile(
                                ptitle: "Terms and Conditions",
                                picon: BlueChipIcons.paper,
                                ppage: "/settings-books",
                              ),
                              Profile2Tile(
                                ptitle: "Rate Us",
                                picon: BlueChipIcons.star,
                                ppage: "/settings-about",
                              ),
                              Profile2Tile(
                                ptitle: "Share with friends",
                                picon: BlueChipIcons.user,
                                ppage: "/settings-support",
                              ),
                            ]),
                          ),
                          BCTButton(
                            title: "Sign Out",
                          ),
                        ],
                      ),
                    ),
                  );
                }
              });
        }));
  }
}

class BCTButton extends StatelessWidget {
  const BCTButton({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _authcontroller.handleSignOut();
        // _authcontroller.handleSignOut();
        //Get.snackbar('Signed Out', 'Sad to see you going...');
      },
      child: Container(
          margin: EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
              color: MyTheme().bcButtonColor,
              borderRadius: BorderRadius.all(Radius.circular(13))),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          )),
    );
  }
}
