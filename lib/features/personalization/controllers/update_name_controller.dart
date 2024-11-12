import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_bazar/data/repositories/user/user_repository.dart';
import 'package:smart_bazar/features/personalization/controllers/user_controller.dart';
import 'package:smart_bazar/utils/popops/full_screen_loader.dart';
import 'package:smart_bazar/utils/popops/loaders.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../screens/profile/profile.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  ///init user data when Home Screen appears

  @override
  void onInit() {
    initializeNames();
    // TODO: implement onInit
    super.onInit();
  }

  ///Fetch user data
  Future<void> initializeNames() async {
    firstNameController.text = userController.user.value.firstName;
    lastNameController.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          "We are updating your information...", TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      Map<String, dynamic> name = {
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim(),
      };

      //update the Rx User Value
      userController.user.value.firstName = firstNameController.text.trim();
      userController.user.value.lastName = lastNameController.text.trim();
      //Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
          title: "Congratulations",
          message: "Your name has been updated successfully");

      //Move to the previous screen

      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
