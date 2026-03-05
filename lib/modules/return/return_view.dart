import 'package:e_comm/modules/return/return_controller.dart';
import 'package:e_comm/modules/return/widgets/return_confirm_button.dart';
import 'package:e_comm/modules/return/widgets/return_details_field.dart';
import 'package:e_comm/modules/return/widgets/return_image_upload.dart';
import 'package:e_comm/modules/return/widgets/return_product_card.dar.dart';
import 'package:e_comm/modules/return/widgets/return_reason_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReturnView extends GetView<ReturnController> {
  const ReturnView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<ReturnController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request Return"),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            const ReturnReasonDropdown(),

            const SizedBox(height: 20),

            const ReturnImageUpload(),

            const SizedBox(height: 20),

          //  const ReturnProductCard(image: '', title: '', location: '', size: '', color: '', arrivalDate: '', price: '', oldPrice: '',),

           // const SizedBox(height: 20),

            const ReturnDetailsField(),

            const Spacer(),

            const ReturnConfirmButton()
          ],
        ),
      ),
    );
  }
}