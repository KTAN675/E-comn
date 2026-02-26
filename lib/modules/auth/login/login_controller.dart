import 'dart:async';
import 'package:e_comm/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthController extends GetxController {

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  final otpFocus = FocusNode();

  bool isSignup = false;
  bool otpSent = false;
  bool blocked = false;

  int attempts = 0;
  int seconds = 0;

  Timer? timer;
  String? verificationId;

  void toggleMode() {
    isSignup = !isSignup;
    update();
  }

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

  void focusOtpField() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (Get.context != null) {
        FocusScope.of(Get.context!).requestFocus(otpFocus);
      }
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

    startTimer();
    otpSent = true;
    update();

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91$phone",
      verificationCompleted: (credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        loginSuccess();
      },
      verificationFailed: (e) {
        Get.snackbar("Error", e.message ?? "OTP Failed");
      },
      codeSent: (id, resendToken) {
        verificationId = id;
        focusOtpField();
      },
      codeAutoRetrievalTimeout: (id) {
        verificationId = id;
      },
    );
  }

  Future<void> verifyOtp() async {
    final otp = otpController.text.trim();

    if (!otpSent) {
      Get.snackbar("Error", "Please send OTP first");
      return;
    }

    if (otp.length != 6) {
      Get.snackbar("Error", "Enter valid OTP");
      return;
    }

    final cred = PhoneAuthProvider.credential(
      verificationId: verificationId!,
      smsCode: otp,
    );

    await FirebaseAuth.instance.signInWithCredential(cred);
    loginSuccess();
  }

  void loginSuccess() {
    Get.offAllNamed(AppRoutes.dashboard);
  }

  @override
  void onClose() {
    timer?.cancel();
    phoneController.dispose();
    otpController.dispose();
    otpFocus.dispose();
    super.onClose();
  }
}