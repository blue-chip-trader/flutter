import 'package:get/get.dart';
import 'package:bluechip/app/modules/thisweekevents/controllers/thisweekevents_controller.dart';

class ThisweekeventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThisweekeventsController>(
      () => ThisweekeventsController(),
    );
  }
}
