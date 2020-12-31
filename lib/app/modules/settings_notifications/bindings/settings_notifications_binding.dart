import 'package:get/get.dart';
import 'package:bluechip/app/modules/settings_notifications/controllers/settings_notifications_controller.dart';

class SettingsNotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsNotificationsController>(
      () => SettingsNotificationsController(),
    );
  }
}
