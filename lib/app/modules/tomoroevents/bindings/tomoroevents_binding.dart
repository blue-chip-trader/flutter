import 'package:get/get.dart';
import 'package:bluechip/app/modules/tomoroevents/controllers/tomoroevents_controller.dart';

class TomoroeventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TomoroeventsController>(
      () => TomoroeventsController(),
    );
  }
}
