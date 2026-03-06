import 'package:get/get.dart';
import '../drawer/drawer_controller.dart';
import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<DashboardController>(() => DashboardController());

    /// ADD THIS
    Get.lazyPut<DrawerControllerX>(() => DrawerControllerX());
  }
}