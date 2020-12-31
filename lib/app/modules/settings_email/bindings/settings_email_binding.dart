import 'package:get/get.dart';
import 'package:bluechip/app/modules/settings_email/controllers/settings_email_controller.dart';

class SettingsEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsEmailController>(
      () => SettingsEmailController(),
    );
  }
}
