import 'package:get/get.dart';
import 'package:bluechip/app/modules/todayevents/controllers/todayevents_controller.dart';

class TodayeventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodayeventsController>(
      () => TodayeventsController(),
    );
  }
}
