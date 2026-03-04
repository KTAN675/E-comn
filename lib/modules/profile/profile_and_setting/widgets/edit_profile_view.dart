import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../constant/app_colors.dart';
import '../../../../utils/app_primary_button.dart';
import '../profile_and_setting_controller.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final ProfileAndSettingController ctrl =
  Get.find<ProfileAndSettingController>();

  final ImagePicker _picker = ImagePicker();

  // ================= IMAGE PICK =================
  Future<void> _pickProfileImage() async {
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      ctrl.setProfileImage(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xffF5F5F5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: GetBuilder<ProfileAndSettingController>(
        builder: (_) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 20),

                // ================= PROFILE IMAGE =================
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage: ctrl.profileImage != null
                            ? FileImage(ctrl.profileImage!)
                            : null,
                        child: ctrl.profileImage == null
                            ? const Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.grey,
                        )
                            : null,
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: _pickProfileImage,
                          child: Container(
                            height: 34,
                            width: 34,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors.primaryOrange,
                                width: 1.5,
                              ),
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 18,
                              color: AppColors.primaryOrange,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),

                _buildLabel("Full Name"),
                _buildField(ctrl.nameController),

                const SizedBox(height: 20),

                _buildLabel("Phone Number"),
                _buildField(ctrl.phoneController),

                const SizedBox(height: 20),

                _buildLabel("Email Address"),
                _buildField(ctrl.emailController),

                const SizedBox(height: 20),

                _buildLabel("Date of Birth"),
                _buildDateField(),

                const SizedBox(height: 30),

                const Text(
                  "Address",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 20),

                _buildLabel("Flat/House/Building name"),
                _buildField(ctrl.flatController),

                const SizedBox(height: 20),

                _buildLabel("Floor/Apartment No."),
                _buildField(ctrl.floorController),

                const SizedBox(height: 20),

                _buildLabel("Area/Sector/Locality"),
                _buildField(ctrl.areaController),

                const SizedBox(height: 40),

                AppPrimaryButton(
                  title: "Update Profile",
                  onTap: ctrl.updateProfile,
                ),

                const SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }

  // ================= LABEL =================
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }

  // ================= TEXT FIELD =================
  Widget _buildField(TextEditingController controller) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              cursorColor: AppColors.primaryOrange,
              style: const TextStyle(
                color: AppColors.primaryOrange,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Color(0xFFD9D9D9), // 👈 typing area bhi grey
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          const Icon(
            Icons.edit,
            color: AppColors.primaryOrange,
            size: 22,
          ),
        ],
      ),
    );
  }
  // ================= DATE FIELD =================
  Widget _buildDateField() {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: ctrl.dobController,
              readOnly: true,
              style: const TextStyle(
                color: AppColors.primaryOrange,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Color(0xFFD9D9D9), // 👈 typing area bhi grey
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              DateTime initialDate = DateTime.now();

              if (ctrl.dobController.text.isNotEmpty) {
                final parts = ctrl.dobController.text.split('/');
                if (parts.length == 3) {
                  initialDate = DateTime(
                    int.parse(parts[2]),
                    int.parse(parts[1]),
                    int.parse(parts[0]),
                  );
                }
              }

              final picked = await showDatePicker(
                context: context,
                initialDate: initialDate,
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
              );

              if (picked != null) {
                ctrl.dobController.text =
                "${picked.day.toString().padLeft(2, '0')}/"
                    "${picked.month.toString().padLeft(2, '0')}/"
                    "${picked.year}";
                ctrl.update();
              }
            },
            child: const Icon(
              Icons.calendar_today,
              color: AppColors.primaryOrange,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}