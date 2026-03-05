import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../return_controller.dart';

class ReturnImageUpload extends GetView<ReturnController> {
  const ReturnImageUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Upload Image",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: 10),

        Obx(() {
          return Row(
            children: [

              ...controller.images.map((img) => Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Stack(
                  children: [
                    Image.file(
                      img,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              )),

              GestureDetector(
                onTap: controller.pickImage,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text("+ Add"),
                  ),
                ),
              ),
            ],
          );
        })
      ],
    );
  }
}