import 'package:get/get.dart';
import 'package:bluechip/app/modules/settings_about/controllers/settings_about_controller.dart';

class SettingsAboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsAboutController>(
      () => SettingsAboutController(),
    );
  }
}
