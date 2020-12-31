import 'package:get/get.dart';
import 'package:bluechip/app/modules/signals_history/controllers/signals_history_controller.dart';

class SignalsHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignalsHistoryController>(
      () => SignalsHistoryController(),
    );
  }
}
