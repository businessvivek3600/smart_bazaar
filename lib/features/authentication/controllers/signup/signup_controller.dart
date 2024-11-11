import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_bazar/Model/user_model.dart';
import 'package:smart_bazar/data/repositories/user/user_repository.dart';
import 'package:smart_bazar/features/authentication/screens/sign_up/verify_email.dart';
import 'package:smart_bazar/utils/helpers/network_manager.dart';
import 'package:smart_bazar/utils/popops/full_screen_loader.dart';
import 'package:smart_bazar/utils/popops/loaders.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///-Variables
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  ///--Sign Up
  void signup() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          "We are processing your information...", TImages.docerAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if (!signUpKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: "Accept Privacy Policy",
            message:
                "In Order to create account, you must have to read and accept the Privacy Policy & Terms of Use.");
        return;
      }
      //Register user in the Firebase Authentication $ Save user Data  in the FireBase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //Save Authentication user data in Firebase FireStore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userData = Get.put(UserRepository());
      userData.saveUserRecord(newUser);
      //Remove Loader
      TFullScreenLoader.stopLoading();

      //show success message
      TLoaders.successSnackBar(
          title: "Congratulations",
          message: "Your account has been created! Verify email to continue");

      //Navigate to Home Screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
