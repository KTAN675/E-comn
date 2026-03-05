import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../routes/app_routes.dart';

class LocationPermissionController extends GetxController {

  Future<void> requestLocation() async {

    final status = await Permission.locationWhenInUse.request();

    if (status.isGranted) {
      Get.offAllNamed(AppRoutes.mainShell);
      return;
    }

    if (status.isPermanentlyDenied) {
      openAppSettings();
      return;
    }

    // If denied normally, do nothing.
    // User can press button again.
  }
}