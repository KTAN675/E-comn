import 'package:e_comm/modules/profile/Help%20&%20FAQs/widgets/faq_item.dart';
import 'package:e_comm/modules/profile/Help%20&%20FAQs/widgets/topic_card.dart';
//import 'package:e_comm/widgets/app_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/app_colors.dart';
import '../../../utils/app_primary_button.dart';
import 'help_faqs_controller.dart';

class HelpFaqsView extends GetView<HelpFaqsController> {
  const HelpFaqsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      /// APP BAR
      appBar: AppBar(
        title: Center(child: const Text("Help & FAQs")),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SizedBox(
              width: 82,
              height: 24,
              child: AppPrimaryButton(
                icon: Icons.wechat_outlined,
                title: "Contact Us",
                height: 36,
                fontSize: 10,
                fontWeight: FontWeight.w600,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                onTap: () {
                  // contact action
                },
              ),
            ),
          ),
        ],
      ),

      /// BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Browse Topics
            const Text(
              "Browse Topics",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                TopicCard(title: "Account", icon: Icons.person),
                TopicCard(title: "Return & Exchange", icon: Icons.local_shipping),
                TopicCard(title: "Offers", icon: Icons.local_offer),
                TopicCard(title: "Cancellation & Charges", icon: Icons.event_busy),
                TopicCard(title: "Payments", icon: Icons.currency_rupee),
              ],
            ),

            const SizedBox(height: 30),

            /// FAQ TITLE
            const Text(
              "Frequently Asked Questions",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            /// FAQ LIST
            GetBuilder<HelpFaqsController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.faqList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return FaqItem(
                      index: index,
                      question: controller.faqList[index]["question"]!,
                      answer: controller.faqList[index]["answer"]!,
                      isOpen: controller.selectedFaq == index,
                      onTap: () => controller.toggleFaq(index),
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 30),

            /// CONTACT SECTION
            Center(
              child: Column(
                children: const [
                  Text(
                    "Contact Us On : 2523624411",
                    style: TextStyle(
                      color: AppColors.primaryOrange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Email At - caindan233@gmail.com",
                    style: TextStyle(
                      color: AppColors.primaryOrange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}