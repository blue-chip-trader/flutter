import 'package:get/get.dart';
import 'package:bluechip/app/modules/messages/controllers/messages_controller.dart';

class MessagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessagesController>(
      () => MessagesController(),
    );
  }
}
