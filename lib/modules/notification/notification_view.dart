import 'package:e_comm/modules/notification/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_text_styles.dart';
import '../../utils/custom_tab_switcher.dart';
import '../../utils/segment_toggle.dart';
import 'notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: GetBuilder<NotificationController>(
          builder: (controller) {
            final accent = controller.accent;

            return Column(
              children: [

                /// 🔹 HEADER
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: SizedBox(
                    height: 40,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [

                        /// 🔹 Back Button (Left)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () => Get.back(),
                            child: const Icon(Icons.arrow_back),
                          ),
                        ),

                        /// 🔹 Center Title (True Center)
                        Center(
                          child: Text(
                            "Notification",
                            style: AppTextStyles.body.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        /// 🔹 Theme Toggle (Right)
                        Align(
                          alignment: Alignment.centerRight,
                          child: ThemeToggle(),
                        ),
                      ],
                    ),
                  ),
                ),
                /// 🔹 TAB SWITCHER (Reuse)
                CommonTabSwitcher(
                  tabs: const ["Orders", "Shopping", "Coupons"],
                  selectedIndex: controller.selectedTabIndex,
                  onTabChanged: controller.changeTab,
                  accent: accent,
                ),

                const SizedBox(height: 12),

                /// 🔹 TAB CONTENT
                Expanded(
                  child: controller.currentList.isEmpty
                      ? _EmptyState()
                      : ListView.builder(
                    padding: const EdgeInsets.only(top: 8),
                    itemCount: controller.currentList.length,
                    itemBuilder: (_, index) {
                      final item =
                      controller.currentList[index];

                      return NotificationCard(
                        title: item["title"]!,
                        subtitle: item["subtitle"]!,
                        time: item["time"]!,
                        date: item["date"]!,
                        accent: accent,
                        backgroundColor: controller.cardBg,
                      );
                      },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Nothing To Display Yet !!",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}