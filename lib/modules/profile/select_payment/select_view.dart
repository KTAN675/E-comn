import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/app_colors.dart';
import 'select_controller.dart';
import 'widgets/payment_tile.dart';
import 'widgets/section_title.dart';

class SelectView extends GetView<SelectController> {
  const SelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Column(
          children: const [
            Text(
              "Select Payment",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 2),
            Text(
              "Add ₹100 To Wallet",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [

            /// Preferred Payment
            const SectionTitle(title: "Preferred Payment"),

            Obx(() => Column(
              children: [
                PaymentTile(
                  leading: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "BHIM",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: "UPI",
                  subtitle: "********8317",
                  trailing: controller.selectedPayment.value == "upi"
                      ? const CircleAvatar(
                    radius: 14,
                    backgroundColor: AppColors.primaryOrange,
                    child: Icon(Icons.check,
                        size: 16, color: Colors.white),
                  )
                      : null,
                  onTap: () => controller.selectPayment("upi"),
                ),

                const SizedBox(height: 16),

                /// Pay Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryOrange,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Pay via UPI",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            )),

            /// Credit & Debit
            const SectionTitle(title: "Credit & Debit Card"),

            PaymentTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.add,
                    color: AppColors.primaryOrange),
              ),
              title: "Add New Card",
              subtitle: "Save And Pay Via Cards",
            ),

            /// More Options
            const SectionTitle(title: "More Payment Options"),

            PaymentTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.account_balance,
                    color: Colors.teal),
              ),
              title: "Netbanking",
              subtitle: "select from a list of banks",
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}