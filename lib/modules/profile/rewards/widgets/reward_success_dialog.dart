import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import '../../../../constant/app_text_styles.dart';
import '../../../../utils/app_primary_button.dart';
import '../../../mian_shell/main_shell_controller.dart';
import '../../../mian_shell/main_shell_view.dart';

class RewardSuccessDialog extends StatefulWidget {
  const RewardSuccessDialog({super.key});

  @override
  State<RewardSuccessDialog> createState() => _RewardSuccessDialogState();
}

class _RewardSuccessDialogState extends State<RewardSuccessDialog> {

  late ConfettiController leftController;
  late ConfettiController rightController;

  @override
  void initState() {
    super.initState();

    leftController =
        ConfettiController(duration: const Duration(seconds: 3));

    rightController =
        ConfettiController(duration: const Duration(seconds: 3));

    leftController.play();
    rightController.play();
  }

  @override
  void dispose() {
    leftController.dispose();
    rightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),

      child: Stack(
        alignment: Alignment.center,

        children: [

          /// LEFT CONFETTI
          Positioned(
            left: 0,
            top: 0,
            child: ConfettiWidget(
              confettiController: leftController,
              blastDirection: pi / 4,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.2,
            ),
          ),

          /// RIGHT CONFETTI
          Positioned(
            right: 0,
            top: 0,
            child: ConfettiWidget(
              confettiController: rightController,
              blastDirection: 3 * pi / 4,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.2,
            ),
          ),

          /// MAIN CARD
          Container(
            width: 300,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 28,
            ),

            decoration: BoxDecoration(
              color: const Color(0xffF6EFEA),
              borderRadius: BorderRadius.circular(22),
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Text(
                  "Coupon Applied\nSuccessfully",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h3,
                ),

                const SizedBox(height: 18),

                /// POPPER
                Image.asset(
                  "assets/images/party_popper.png",
                  height: 90,
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: 140,
                  child: AppPrimaryButton(
                    title: "Shop Now",
                      onTap: () {

                        final mainController = Get.find<MainShellController>();

                        /// Close dialog
                        Get.back();

                        Future.delayed(const Duration(milliseconds: 200), () {
                          Get.offAll(() => const MainShellView());
                          mainController.changeTab(0);
                        });

                        // /// Reset navigation stack
                        // Get.offAllNamed('/main-shell');
                        //
                        // /// Switch to dashboard tab
                        // mainController.changeTab(0);
                      }
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}