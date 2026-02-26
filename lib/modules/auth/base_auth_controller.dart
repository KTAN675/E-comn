import 'dart:async';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class BaseAuthController extends GetxController {

  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final otpFocus = FocusNode();

  bool otpSent = false;
  bool blocked = false;

  int attempts = 0;
  int seconds = 0;

  Timer? timer;
  String? verificationId;

  void startTimer() {
    timer?.cancel();
    seconds = 30;
    update();

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds <= 1) {
        t.cancel();
        seconds = 0;
      } else {
        seconds--;
      }
      update();
    });
  }

  Future<void> sendOtp() async {
    if (blocked) return;

    final phone = phoneController.text.trim();

    if (phone.length != 10) {
      Get.snackbar("Error", "Enter valid phone number");
      return;
    }

    attempts++;
    if (attempts > 3) {
      blocked = true;
      update();
      return;
    }

    // ✅ TEST NUMBER
    if (phone == "8111111111") {
      verificationId = "TEST_ID";
      otpSent = true;
      startTimer();
      update();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(Get.context!).requestFocus(otpFocus);
      });

      return;
    }

    startTimer();
    otpSent = true;
    update();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(Get.context!).requestFocus(otpFocus);
    });

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91$phone",
      codeSent: (id, _) {
        verificationId = id;
      },
      verificationFailed: (e) {
        Get.snackbar("Error", e.message ?? "OTP Failed");
      },
      verificationCompleted: (_) {},
      codeAutoRetrievalTimeout: (id) {
        verificationId = id;
      },
    );
  }
  Future<void> verifyOtp() async {
    final phone = phoneController.text.trim();
    final otp = otpController.text.trim();

    if (!otpSent) {
      Get.snackbar("Error", "Please send OTP first");
      return;
    }

    if (otp.length != 6) {
      Get.snackbar("Error", "Enter valid OTP");
      return;
    }

    // TEST LOGIN
    if (phone == "8111111111" && otp == "123456") {
      onAuthSuccess();
      return;
    }

    if (verificationId == null) {
      Get.snackbar("Error", "Verification not ready");
      return;
    }

    final cred = PhoneAuthProvider.credential(
      verificationId: verificationId!,
      smsCode: otp,
    );

    await FirebaseAuth.instance.signInWithCredential(cred);

    onAuthSuccess();
  }
  void onAuthSuccess(); // abstract method

  @override
  void onClose() {
    timer?.cancel();
    phoneController.dispose();
    otpController.dispose();
    otpFocus.dispose();
    super.onClose();
  }
}