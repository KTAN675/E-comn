import 'package:get/get.dart';
import 'profile_and_setting_controller.dart';

class ProfileAndSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileAndSettingController>(
      () => ProfileAndSettingController(),
    );
  }
}
