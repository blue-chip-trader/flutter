import 'package:get/get.dart';
import 'package:bluechip/app/modules/settings_theme/controllers/settings_theme_controller.dart';

class SettingsThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsThemeController>(
      () => SettingsThemeController(),
    );
  }
}
