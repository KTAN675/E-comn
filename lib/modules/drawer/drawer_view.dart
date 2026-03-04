import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import 'drawer_controller.dart';

class DrawerView extends GetView<DrawerControllerX> {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFFFF6A00),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔥 HEADER
              Padding(
                padding: const EdgeInsets.all(20),
                child: GetBuilder<DrawerControllerX>(
                  builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        Get.back(); // drawer close
                        Get.toNamed(AppRoutes.ProfileAndSetting); // profile open
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage:
                            NetworkImage(controller.profileImage),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello ${controller.userName}",
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                controller.userRole,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Divider(color: Colors.white54),

              /// 🔥 MENU ITEMS
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  children: [

                    _menuItem(
                      icon: Icons.shopping_bag_outlined,
                      title: "Orders",
                      onTap: controller.goToOrders,
                    ),

                    _menuItem(
                      icon: Icons.help_outline,
                      title: "Ask question",
                      onTap: controller.askQuestion,
                    ),

                    _menuItem(
                      icon: Icons.description_outlined,
                      title: "Terms & service",
                      onTap: controller.openTerms,
                    ),

                    _menuItem(
                      icon: Icons.chat_bubble_outline,
                      title: "FAQs",
                      onTap: controller.openFaq,
                    ),

                    _menuItem(
                      icon: Icons.privacy_tip_outlined,
                      title: "Privacy policy",
                      onTap: controller.openPrivacy,
                    ),

                    _menuItem(
                      icon: Icons.assignment_outlined,
                      title: "Return and refund policy",
                      onTap: controller.openReturnPolicy,
                    ),

                    _menuItem(
                      icon: Icons.call_outlined,
                      title: "Call us",
                      onTap: controller.callUs,
                    ),

                    const SizedBox(height: 10),

                    _menuItem(
                      icon: Icons.logout,
                      title: "Logout",
                      onTap: controller.logout,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      leading: Icon(icon, color: Colors.white, size: 26),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      onTap: onTap,
    );
  }
}