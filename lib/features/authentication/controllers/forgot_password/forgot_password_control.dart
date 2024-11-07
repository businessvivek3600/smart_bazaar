

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smart_bazar/utils/constants/image_strings.dart';
import 'package:smart_bazar/utils/popops/full_screen_loader.dart';
import 'package:smart_bazar/utils/popops/loaders.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../screens/password_configuration/reset_password.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();


  ///variables
final email = TextEditingController();
GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

/// Send Password Reset Email
  Future<void> sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog("Processing your request...", TImages.docerAnimation);
      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      /// Send Password Reset Email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text.trim());
      ///Remove Loader
      TFullScreenLoader.stopLoading();

      ///Show Success Message
      TLoaders.successSnackBar(title: "Email Sent", message: "Email Link Sent to ${email.text} for reset your password".tr);

      ///Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();

      ///Show Error Message
      TLoaders.successSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /// Resend Verification email
resendEmailVerification(String email) async {
  try {
    TFullScreenLoader.openLoadingDialog("Processing your request...", TImages.docerAnimation);
    //Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();

    if(!isConnected){
      TFullScreenLoader.stopLoading();
      return;
    }
    /// Send Password Reset Email
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    ///Remove Loader
    TFullScreenLoader.stopLoading();

    ///Show Success Message
    TLoaders.successSnackBar(title: "Email Sent", message: "Email Link Sent to $email for reset your password".tr);

  } catch (e) {
    TFullScreenLoader.stopLoading();

    ///Show Error Message
    TLoaders.successSnackBar(title: "Oh Snap!", message: e.toString());
  }
  }


}