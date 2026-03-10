import 'package:realtime_user/modules/exchange/widgets/exchange_additional_details.dart';
import 'package:realtime_user/modules/exchange/widgets/exchange_reason_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../utils/app_primary_button.dart';
import 'exchange_controller.dart';

class ExchangeView extends GetView<ExchangeController> {
  const ExchangeView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text("Request Exchange"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            const ExchangeReasonDropdown(),

            const SizedBox(height: 20),

            const ExchangeAdditionalDetails(),

            const Spacer(),

            AppPrimaryButton(
              title: "Confirm Exchange",
              onTap: controller.confirmExchange,
            )
          ],
        )
      ),
    );
  }
}