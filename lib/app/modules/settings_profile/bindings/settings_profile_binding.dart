import 'package:get/get.dart';
import 'package:bluechip/app/modules/settings_profile/controllers/settings_profile_controller.dart';

class SettingsProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsProfileController>(
      () => SettingsProfileController(),
    );
  }
}
