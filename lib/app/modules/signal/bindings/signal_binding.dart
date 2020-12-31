import 'package:get/get.dart';
import 'package:bluechip/app/modules/signal/controllers/signal_controller.dart';

class SignalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignalController>(
      () => SignalController(),
    );
  }
}
