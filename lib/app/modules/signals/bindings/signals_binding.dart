import 'package:get/get.dart';
import 'package:bluechip/app/modules/signals/controllers/signals_controller.dart';

class SignalsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignalsController>(
      () => SignalsController(),
    );
  }
}
