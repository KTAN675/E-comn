import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realtime_user/modules/profile/Help%20&%20FAQs/widgets/contact_us_dialog.dart';
import 'package:realtime_user/modules/profile/Help%20&%20FAQs/widgets/faq_item.dart';
import 'package:realtime_user/modules/profile/Help%20&%20FAQs/widgets/topic_card.dart';
import '../../../constant/app_colors.dart';
import '../../../utils/app_primary_button.dart';
import '../../theme/theme_controller.dart';
import 'help_faqs_controller.dart';

class HelpFaqsView extends GetView<HelpFaqsController> {
  const HelpFaqsView({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ThemeController>(
      builder: (theme) {

        final Color accent = theme.currentAccent; // ✅ Dynamic accent

        return Scaffold(
          backgroundColor: Colors.grey.shade100,

          /// APP BAR
          appBar: AppBar(
            backgroundColor: accent, // ✅ Dynamic
            elevation: 0,
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 18,
              ),
            ),
            title: const Text(
              "Help & FAQs",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            centerTitle: true,

            /// Contact Button
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () => ContactUsDialog.show(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.wechat_outlined,
                          color: accent, // ✅ Dynamic
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "Contact Us",
                          style: TextStyle(
                            color: accent, // ✅ Dynamic
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
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
                  childAspectRatio: 1.3,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    TopicCard(title: "Account", icon: Icons.person),
                    TopicCard(title: "Return & Exchange", icon: Icons.local_shipping),
                    TopicCard(title: "Payments", icon: Icons.currency_rupee),
                    TopicCard(title: "Cancellation & Charges", icon: Icons.event_busy),
                  ],
                ),

                const SizedBox(height: 30),

                /// FAQ Title
                const Text(
                  "Frequently Asked Questions",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                /// FAQ List
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
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 24),

                /// Ask Question
                const Text(
                  "Ask Question",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                /// TextField
                /// TextField
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Ask here",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(14),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: accent, width: 1.5),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                /// Add Button
                SizedBox(
                  width: double.infinity,
                  child: AppPrimaryButton(
                    title: "Add",
                    height: 52,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    onTap: () {},
                  ),
                ),

                const SizedBox(height: 30),

                /// Contact Section
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Contact Us On : 2523624411",
                        style: TextStyle(
                          color: accent, // ✅ Dynamic
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Email At - caindan233@gmail.com",
                        style: TextStyle(
                          color: accent, // ✅ Dynamic
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}