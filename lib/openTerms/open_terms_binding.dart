import 'package:get/get.dart';
import 'open_terms_controller.dart';

class OpenTermsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OpenTermsController>(() => OpenTermsController());
  }
}