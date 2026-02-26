import '../../../routes/app_routes.dart';
import 'package:get/get.dart';

import '../base_auth_controller.dart';

class SignupController extends BaseAuthController {

  @override
  void onAuthSuccess() {
    Get.offAllNamed(AppRoutes.locationPermission);  }
}