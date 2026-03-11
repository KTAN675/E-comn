import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../constant/app_colors.dart';
import '../../../../utils/app_primary_button.dart';
import '../../../theme/theme_controller.dart';
import '../profile_and_setting_controller.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {

  final ProfileAndSettingController ctrl =
  Get.find<ProfileAndSettingController>();

  // ✅ Get ThemeController
  final ThemeController theme = Get.find<ThemeController>();

  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

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
    return GetBuilder<ThemeController>(
      builder: (theme) {

        final Color accent = theme.currentAccent; // ✅ Dynamic accent

        return Scaffold(
          backgroundColor: const Color(0xffF5F5F5),

          appBar: AppBar(
            backgroundColor: accent, // ✅ Dynamic
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white), // ✅
              onPressed: () => Get.back(),
            ),
            centerTitle: true,
            title: const Text(
              "Profile",
              style: TextStyle(
                color: Colors.white, // ✅
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          body: GetBuilder<ProfileAndSettingController>(
            builder: (_) {
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
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
                                  height: 36,
                                  width: 36,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: accent, // ✅ Dynamic
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    size: 18,
                                    color: accent, // ✅ Dynamic
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      _buildLabel("Full Name"),
                      _buildField(
                        accent: accent,
                        controller: ctrl.nameController,
                        hint: "Enter full name",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Name is required";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      _buildLabel("Phone Number"),
                      _buildField(
                        accent: accent,
                        controller: ctrl.phoneController,
                        hint: "Enter phone number",
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Phone number required";
                          }
                          if (value.length < 10) {
                            return "Invalid phone number";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      _buildLabel("Email Address"),
                      _buildField(
                        accent: accent,
                        controller: ctrl.emailController,
                        hint: "Enter email",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email required";
                          }
                          if (!GetUtils.isEmail(value)) {
                            return "Invalid email";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      _buildLabel("Date of Birth"),
                      _buildDateField(accent: accent),

                      const SizedBox(height: 40),

                      AppPrimaryButton(
                        title: "Update Profile",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            ctrl.updateProfile();
                          }
                        },
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
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
  Widget _buildField({
    required Color accent, // ✅ Accept accent
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: accent, // ✅ Dynamic
      style: TextStyle(
        color: accent, // ✅ Dynamic
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFD9D9D9),
        suffixIcon: Icon(
          Icons.edit,
          color: accent, // ✅ Dynamic
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
      ),
    );
  }

  // ================= DATE FIELD =================
  Widget _buildDateField({required Color accent}) { // ✅ Accept accent
    return TextFormField(
      controller: ctrl.dobController,
      readOnly: true,
      decoration: InputDecoration(
        hintText: "Select date",
        filled: true,
        fillColor: const Color(0xFFD9D9D9),
        suffixIcon: Icon(
          Icons.calendar_today,
          color: accent, // ✅ Dynamic
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
      ),
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
    );
  }
}