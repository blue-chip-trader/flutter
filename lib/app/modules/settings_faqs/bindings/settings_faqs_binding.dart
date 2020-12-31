import 'package:get/get.dart';
import 'package:bluechip/app/modules/settings_faqs/controllers/settings_faqs_controller.dart';

class SettingsFaqsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsFaqsController>(
      () => SettingsFaqsController(),
    );
  }
}
