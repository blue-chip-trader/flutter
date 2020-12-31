import 'package:get/get.dart';
import 'package:bluechip/app/modules/settings_subscription/controllers/settings_subscription_controller.dart';

class SettingsSubscriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsSubscriptionController>(
      () => SettingsSubscriptionController(),
    );
  }
}
