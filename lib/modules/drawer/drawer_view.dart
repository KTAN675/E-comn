import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../routes/app_routes.dart';
import '../theme/theme_controller.dart';
import 'drawer_controller.dart';

class DrawerView extends GetView<DrawerControllerX> {
  final VoidCallback? onClose;
  const DrawerView({super.key, this.onClose});

  void _close() {
    if (onClose != null) {
      onClose!();
    } else {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return GetBuilder<ThemeController>(
      builder: (_) {
        return Material(
          type: MaterialType.transparency,
          child: Stack(
            children: [
              /// SCRIM
              Positioned.fill(
                child: GestureDetector(
                  onTap: _close,
                  child: Container(color: Colors.black54),
                ),
              ),

              /// DRAWER PANEL
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: width * 0.75,
                  color: AppColors.accent,
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: GetBuilder<DrawerControllerX>(
                            builder: (controller) {
                              return GestureDetector(
                                onTap: () {
                                  _close();
                                  Get.toNamed(AppRoutes.ProfileAndSetting);
                                },
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundImage: NetworkImage(controller.profileImage),
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hello ${controller.userName}",
                                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(controller.userRole, style: const TextStyle(fontSize: 16, color: Colors.white70)),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const Divider(color: Colors.white54),
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            children: [
                              _menuItem(icon: Icons.shopping_bag_outlined, title: "Orders", onTap: () { _close(); controller.goToOrders(); }),
                              _menuItem(icon: Icons.help_outline, title: "Ask question", onTap: () { _close(); controller.help_and_faqs(); }),
                              _menuItem(icon: Icons.description_outlined, title: "Terms & service", onTap: () { _close(); controller.openTerms(); }),
                              _menuItem(icon: Icons.chat_bubble_outline, title: "FAQs", onTap: () { _close(); controller.help_and_faqs(); }),
                              _menuItem(icon: Icons.privacy_tip_outlined, title: "Privacy policy", onTap: () { _close(); controller.privacyPolicy(); }),
                              _menuItem(icon: Icons.assignment_outlined, title: "Return and refund policy", onTap: () { _close(); controller.help_and_faqs(); }),
                              _menuItem(icon: Icons.call_outlined, title: "Call us", onTap: () { _close(); controller.help_and_faqs(); }),
                              const SizedBox(height: 10),
                              _menuItem(icon: Icons.logout, title: "Logout", onTap: () { _close(); controller.logout(); }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _menuItem({required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      leading: Icon(icon, color: Colors.white, size: 26),
      title: Text(title, style: const TextStyle(fontSize: 18, color: Colors.white)),
      onTap: onTap,
    );
  }
}
