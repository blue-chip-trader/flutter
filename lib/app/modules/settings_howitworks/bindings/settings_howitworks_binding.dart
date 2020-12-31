import 'package:get/get.dart';
import 'package:bluechip/app/modules/settings_howitworks/controllers/settings_howitworks_controller.dart';

class SettingsHowitworksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsHowitworksController>(
      () => SettingsHowitworksController(),
    );
  }
}
