import 'package:get/get.dart';

class HelpFaqsController extends GetxController {

  RxInt selectedFaq = 0.obs;

  final List<Map<String, String>> faqList = [
    {
      "question": "Alright, but what exactly do you do?",
      "answer":
      "As a creative agency we work with you to develop solutions to address your brand needs. That includes various aspects of brand planning and strategy, marketing and design."
    },
    {
      "question":
      "I don't need a brand strategist but I need help executing an upcoming campaign. Can we still work together?",
      "answer":
      "Yes, we can help execute campaigns, design assets and provide marketing support."
    },
    {
      "question": "Are your rates competitive?",
      "answer":
      "Yes, our pricing is competitive and depends on the scope of work."
    },
    {
      "question": "Why do you have a monthly project cap?",
      "answer":
      "We limit projects monthly to maintain quality and deliver the best results."
    }
  ];

  void toggleFaq(int index) {
    if (selectedFaq.value == index) {
      selectedFaq.value = -1;
    } else {
      selectedFaq.value = index;
    }
  }
}