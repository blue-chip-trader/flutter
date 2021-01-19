import 'package:bluechip/app/presentation/blue_chip_icons_icons.dart';
import 'package:bluechip/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/settings_notifications/controllers/settings_notifications_controller.dart';

class SettingsNotificationsView
    extends GetView<SettingsNotificationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme().bcBackground,
      appBar: AppBar(
        title: Text('Notifications Settings'),
        centerTitle: true,
        backgroundColor: MyTheme().bcPrimaryColor,
      ),
      body: GetBuilder<SettingsNotificationsController>(
        init: SettingsNotificationsController(),
        initState: (_) {},
        builder: (value) {
          return FutureBuilder(
              future: value.users.doc(value.uid).get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  Map<String, dynamic> data = snapshot.data.data();
                  return Center(
                    child: Container(
                        margin: EdgeInsets.all(15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: MyTheme().bcPrimaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(13))),
                        child: Column(children: [
                          ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  color: MyTheme().bcPrimaryColor2,
                                  borderRadius: BorderRadius.circular(100)),
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
                                  initialValue: data["signalsnotifs"],
                                  builder: (_isSec, updateFn) =>
                                      CupertinoSwitch(
                                          value: data["signalsnotifs"],
                                          activeColor: Colors.black,
                                          trackColor: MyTheme().bcButtonColor,
                                          onChanged: updateFn),
                                  onUpdate: (value) {
                                    snapshot.data.users.doc(controller.uid).update({
                                      'signalsnotifs': value, // John Doe
                                    
                                      // 'ctoken': ctoken // 42
                                    });
                                  }),
                            ),
                          ),
                        ])),
                  );
                }
              });
        },
      ),
    );
  }
}
