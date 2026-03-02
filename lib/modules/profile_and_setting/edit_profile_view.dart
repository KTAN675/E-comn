import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_text_styles.dart';
import '../../utils/app_primary_button.dart';
import 'profile_and_setting_controller.dart';

class EditProfileView extends GetView<ProfileAndSettingController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text('Profile', style: AppTextStyles.h2),
      ),
      body: GetBuilder<ProfileAndSettingController>(
        builder: (ctrl) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),

                /// 🔹 Avatar with edit badge
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.grey[200],
                        child: const Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.grey,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.primaryOrange,
                              width: 1.5,
                            ),
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 16,
                            color: AppColors.primaryOrange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                /// 🔹 Full Name
                _buildFieldLabel('Full Name'),
                _buildProfileField(ctrl.nameController),

                const SizedBox(height: 20),

                /// 🔹 Phone Number
                _buildFieldLabel('Phone Number'),
                _buildProfileField(ctrl.phoneController),

                const SizedBox(height: 20),

                /// 🔹 Email Address
                _buildFieldLabel('Email Address'),
                _buildProfileField(ctrl.emailController),

                const SizedBox(height: 20),

                /// 🔹 Date of Birth
                _buildFieldLabel('Date of Birth'),
                _buildDateField(ctrl),

                const SizedBox(height: 28),

                /// 🔹 Address Section Header
                Text('Address', style: AppTextStyles.h3),

                const SizedBox(height: 16),

                /// 🔹 Flat/House/Building name
                _buildFieldLabel('Flat/House/Building name'),
                _buildProfileField(ctrl.flatController),

                const SizedBox(height: 20),

                /// 🔹 Floor/Apartment No.
                _buildFieldLabel('Floor/Apartment No.'),
                _buildProfileField(ctrl.floorController),

                const SizedBox(height: 20),

                /// 🔹 Area/Sector/Locality
                _buildFieldLabel('Area/Sector/Locality'),
                _buildProfileField(ctrl.areaController),

                const SizedBox(height: 32),

                /// 🔹 Update Profile Button
                AppPrimaryButton(
                  title: 'Update Profile',
                  onTap: ctrl.updateProfile,
                ),

                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }

  // =============================
  // FIELD LABEL
  // =============================

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // =============================
  // PROFILE TEXT FIELD
  // =============================

  Widget _buildProfileField(TextEditingController textController) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border, width: 1.5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              style: AppTextStyles.body.copyWith(
                color: AppColors.primaryOrange,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
          const Icon(Icons.edit, size: 18, color: AppColors.primaryOrange),
        ],
      ),
    );
  }

  // =============================
  // DATE FIELD
  // =============================

  Widget _buildDateField(ProfileAndSettingController ctrl) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border, width: 1.5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: ctrl.dobController,
              readOnly: true,
              style: AppTextStyles.body.copyWith(
                color: AppColors.primaryOrange,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final picked = await showDatePicker(
                context: Get.context!,
                initialDate: DateTime(1999, 7, 17),
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                ctrl.dobController.text =
                    '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
              }
            },
            child: const Icon(
              Icons.calendar_today,
              size: 18,
              color: AppColors.primaryOrange,
            ),
          ),
        ],
      ),
    );
  }
}
