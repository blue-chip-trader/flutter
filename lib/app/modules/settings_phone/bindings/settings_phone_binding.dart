import 'package:get/get.dart';
import 'package:bluechip/app/modules/settings_phone/controllers/settings_phone_controller.dart';

class SettingsPhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsPhoneController>(
      () => SettingsPhoneController(),
    );
  }
}
