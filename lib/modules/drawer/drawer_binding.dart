import 'package:get/get.dart';
import '../dashboard/dashboard_controller.dart';
import 'drawer_controller.dart';

class DrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());

    // 👇 ADD THIS LINE
    Get.lazyPut<DrawerControllerX>(() => DrawerControllerX());
  }
}