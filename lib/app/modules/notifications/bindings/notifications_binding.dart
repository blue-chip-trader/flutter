import 'package:get/get.dart';
import 'package:bluechip/app/modules/notifications/controllers/notifications_controller.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsController>(
      () => NotificationsController(),
    );
  }
}
