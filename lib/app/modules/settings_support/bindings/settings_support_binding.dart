import 'package:get/get.dart';
import 'package:bluechip/app/modules/settings_support/controllers/settings_support_controller.dart';

class SettingsSupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsSupportController>(
      () => SettingsSupportController(),
    );
  }
}
