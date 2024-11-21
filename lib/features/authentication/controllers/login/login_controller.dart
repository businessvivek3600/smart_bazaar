import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_bazar/features/authentication/screens/login/login_screen.dart';
import 'package:smart_bazar/utils/constants/image_strings.dart';
import 'package:smart_bazar/utils/popops/full_screen_loader.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popops/loaders.dart';
import '../../../personalization/controllers/user_controller.dart';

class LoginController extends GetxController {
  ///Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
 final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? "";
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? '';
    super.onInit();
  }

  ///-- Email and password login
  Future<void> emailAndPasswordLogin() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "Logging you in...", TImages.docerAnimation);
      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected

      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      //Login user in the Firebase Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      print("--------------------------------");
      print(e);
      TLoaders.errorSnackBar(title: "Oh Snap! login error", message: e.toString());
    }
  }

  /// Google Sign-In
  Future<void> googleSignInFunction() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "Logging in with Google...", TImages.docerAnimation);
      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.googleSignIn();

      //Save User Record
    await  userController.saveUserRecord(userCredentials);
      ///Remove loader
      TFullScreenLoader.stopLoading();
      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
          title: "Google Sign-In Failed", message: e.toString());
    }
  }

  ///--Hide Password
  void hidePasswordFunction() {
    hidePassword.value = !hidePassword.value;
  }

  ///--Logout the current user
  Future<void> logoutUser() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "Logging you out...", TImages.docerAnimation);

      // Optional: Log out from Firebase (if applicable)
      await AuthenticationRepository.instance.logout();

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Redirect to login screen
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Logout Failed", message: e.toString());
    }
  }
}
