import 'package:get/get.dart';
import '../../theme/theme_controller.dart';

class HelpFaqsController extends GetxController {
  final ThemeController theme = Get.find<ThemeController>();

  int selectedFaq = -1;

  void toggleFaq(int index) {
    if (selectedFaq == index) {
      selectedFaq = -1;
    } else {
      selectedFaq = index;
    }
    update();
  }

  final List<Map<String, String>> faqList = [
    {
      "question": "Alright, but what exactly do you do?",
      "answer":
      "As a creative agency we work with you to develop solutions to address your brand needs. That includes various aspects of brand planning and strategy, marketing and design.",
    },
    {
      "question":
      "I don't need a brand strategist but I need help executing an upcoming campaign. Can we still work together?",
      "answer":
      "Yes, we can help execute campaigns, design assets and provide marketing support without a full brand strategy engagement.",
    },
    {
      "question": "Are your rates competitive?",
      "answer":
      "Yes, our pricing is competitive and depends on the scope of work. We offer flexible packages to suit different budgets.",
    },
    {
      "question": "Why do you have a monthly project cap?",
      "answer":
      "We limit projects monthly to maintain quality and deliver the best results for every client we work with.",
    },
  ];
}
