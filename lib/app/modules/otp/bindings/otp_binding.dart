import 'package:get/get.dart';
import 'package:bluechip/app/modules/otp/controllers/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(
      () => OtpController(),
    );
  }
}
