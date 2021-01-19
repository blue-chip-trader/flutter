import 'package:get/get.dart';
import 'package:bluechip/app/modules/popfeed/controllers/popfeed_controller.dart';

class PopfeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PopfeedController>(
      () => PopfeedController(),
    );
  }
}
