import 'package:get/get.dart';
import 'package:bluechip/app/modules/settings_books/controllers/settings_books_controller.dart';

class SettingsBooksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsBooksController>(
      () => SettingsBooksController(),
    );
  }
}
