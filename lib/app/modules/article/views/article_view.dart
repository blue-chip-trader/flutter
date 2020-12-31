import 'package:bluechip/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/article/controllers/article_controller.dart';
import 'package:get_storage/get_storage.dart';

class ArticleView extends GetView<ArticleController> {
  @override
  Widget build(BuildContext context) {
    final appData = GetStorage();
    bool _isDarkMode = appData.read("_isDark");
    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
        centerTitle: true,
        backgroundColor: _isDarkMode ? MyTheme().bcAppBarColor : MyThemeLight().bcAppBarColor,
      ),
      body: Center(
        child: Text(
          'ArticleView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
