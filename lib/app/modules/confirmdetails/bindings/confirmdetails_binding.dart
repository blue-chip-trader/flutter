import 'package:get/get.dart';
import 'package:bluechip/app/modules/confirmdetails/controllers/confirmdetails_controller.dart';

class ConfirmdetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmdetailsController>(
      () => ConfirmdetailsController(),
    );
  }
}
