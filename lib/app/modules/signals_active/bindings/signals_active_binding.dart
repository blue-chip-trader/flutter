import 'package:get/get.dart';
import 'package:bluechip/app/modules/signals_active/controllers/signals_active_controller.dart';

class SignalsActiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignalsActiveController>(
      () => SignalsActiveController(),
    );
  }
}
