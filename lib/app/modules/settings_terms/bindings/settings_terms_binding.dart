import 'package:get/get.dart';
import 'package:bluechip/app/modules/settings_terms/controllers/settings_terms_controller.dart';

class SettingsTermsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsTermsController>(
      () => SettingsTermsController(),
    );
  }
}
