import 'package:get/get.dart';

import 'help_faqs_controller.dart';


class HelpFaqsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpFaqsController>(
          () => HelpFaqsController(),
    );
  }
}