import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smart_bazar/common/widgets/success_screen/success_screen.dart';
import 'package:smart_bazar/data/repositories/authentication/authentication_repository.dart';
import 'package:smart_bazar/utils/constants/text_strings.dart';
import 'package:smart_bazar/utils/popops/loaders.dart';

import '../../../../utils/constants/image_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen Appears & set Timer for Auto Redirect
  @override
  void onInit() async {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailAndVerification();
      TLoaders.successSnackBar(
          title: "Email Sent",
          message: "Please  Check your inbox and verify your email.");
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
       timer.cancel();
        Get.off(SuccessScreen(image: TImages.staticSuccessIllustration, title: TTexts.yourAccountCreatedTitle, subTitle: TTexts.yourAccountCreatedSubTitle, onPressed: () => AuthenticationRepository.instance.screenRedirect(),));
      }
    });
  }


  ///Manually check if email Verified
  checkEmailVerificationStatus() {
    final currentUser =  FirebaseAuth.instance.currentUser;
    if (currentUser?.emailVerified?? false) {
      Get.off(SuccessScreen(image: TImages.staticSuccessIllustration, title: TTexts.yourAccountCreatedTitle, subTitle: TTexts.yourAccountCreatedSubTitle, onPressed: () => AuthenticationRepository.instance.screenRedirect(),));
    } else {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: "Please Verify your Email.");
    }
  }
}
