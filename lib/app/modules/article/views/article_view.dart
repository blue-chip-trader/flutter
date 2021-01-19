import 'package:bluechip/app/presentation/blue_chip_icons_icons.dart';
import 'package:bluechip/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:bluechip/app/modules/article/controllers/article_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends GetView<ArticleController> {
  String url = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme().bcPrimaryColor,
        appBar: AppBar(
          title: Text("Commodities"),
          centerTitle: true,
          backgroundColor: MyTheme().bcPrimaryColor,
        ),
        body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          
        ));
  }
}
