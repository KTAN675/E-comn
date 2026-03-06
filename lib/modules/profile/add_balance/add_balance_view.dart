import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../../constant/app_colors.dart';
import '../../../routes/app_routes.dart';

class AddBalanceView extends StatefulWidget {
  const AddBalanceView({super.key});

  @override
  State<AddBalanceView> createState() => _AddBalanceViewState();
}

class _AddBalanceViewState extends State<AddBalanceView> {
  int availableBalance = 1000;
  int selectedAmount = 100;

  final TextEditingController _amountController =
  TextEditingController(text: "100");

  final List<int> predefinedAmounts = [100, 250, 500, 1000];

  void selectAmount(int amount) {
    setState(() {
      selectedAmount = amount;
      _amountController.text = amount.toString();
    });
  }

  void redeemVoucher() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Redeem voucher clicked")),
    );
  }

  void proceedToAddBalance() {
    if (selectedAmount <= 0) {
      Get.snackbar(
        "Invalid Amount",
        "Please enter a valid amount",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.toNamed(
      AppRoutes.select_payment,
      arguments: selectedAmount,
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Add Balance",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///  Available Balance Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primaryOrange,
                borderRadius: BorderRadius.circular(19),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Available Balance",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "₹$availableBalance",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            ///  Grey Card Section
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xffEEEEEE),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Enter Amount",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 12),

                  /// Amount Field
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffE3E3E3),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 14, vertical: 12),
                        prefixText: "₹",
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedAmount = int.tryParse(value) ?? 0;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  ///  Predefined Chips (FIXED)
                  Row(
                    children: predefinedAmounts.map((amount) {
                      final bool isSelected = selectedAmount == amount;

                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: GestureDetector(
                            onTap: () => selectAmount(amount),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xffFFE7D6)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.primaryOrange
                                      : Colors.grey.shade400,
                                ),
                              ),
                              child: Text(
                                "₹$amount",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? AppColors.primaryOrange
                                      : Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 20),
                  Divider(color: Colors.grey.shade400),
                  const SizedBox(height: 12),

                  /// Voucher Row
                  Row(
                    children: [
                      const Text(
                        "Have a gift voucher ? ",
                        style: TextStyle(color: Colors.black54),
                      ),
                      GestureDetector(
                        onTap: redeemVoucher,
                        child: const Text(
                          "Redeem Now",
                          style: TextStyle(
                            color: AppColors.primaryOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            ///  Bottom Button
            SizedBox(
              width: 335,
              child: ElevatedButton(
                onPressed: proceedToAddBalance,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryOrange,
                  padding:
                  const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  "Proceed to Add Balance",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}