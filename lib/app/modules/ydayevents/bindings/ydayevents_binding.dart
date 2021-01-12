import 'package:get/get.dart';
import 'package:bluechip/app/modules/ydayevents/controllers/ydayevents_controller.dart';

class YdayeventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YdayeventsController>(
      () => YdayeventsController(),
    );
  }
}
