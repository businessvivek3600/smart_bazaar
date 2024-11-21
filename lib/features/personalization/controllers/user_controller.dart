import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_bazar/data/repositories/authentication/authentication_repository.dart';
import 'package:smart_bazar/data/repositories/user/user_repository.dart';
import 'package:smart_bazar/features/personalization/screens/profile/widgets/re_authenticate_user_login_from.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';
import 'package:smart_bazar/utils/popops/loaders.dart';

import '../../../Model/user_model.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popops/full_screen_loader.dart';
import '../../authentication/screens/login/login_screen.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  //variables
  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyPassword = TextEditingController();
  final verifyEmail = TextEditingController();
  final localStorage = GetStorage();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel
      .empty()
      .obs;
  final userProfileLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch User Record
  Future<void> fetchUserRecord() async {
    try {
      userProfileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      userProfileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      userProfileLoading.value = false;
    }
  }

  /// Save user Record from any registration Provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
  final user1 =   UserModel(
      id: userCredentials!.user!.uid,
      email: userCredentials.user!.email ?? '' ,
      firstName: userCredentials.user!.displayName ?? '',
      phoneNumber: userCredentials.user!.phoneNumber ?? '',
      username: userCredentials.user!.uid ?? '',
      profilePicture: userCredentials.user!.photoURL ?? '', lastName: '',
    );
  print("--------------------------------");
   print("${user1.id} ${user1.email} ${user1.firstName} ${user1.phoneNumber} ${user1.username} ${user1.profilePicture} ${user1.lastName}");
   print("--------------------------------");
    try {
      //Refresh user Record

      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          //Convert Name to first and last name
          final nameParts =
          UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final userName = UserModel.generateUserName(
              userCredentials.user!.displayName ?? '');

          //Map Data
          final user = UserModel(
            id: userCredentials.user!.uid,
            email: userCredentials.user!.email ?? '',
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            username: userName,
            profilePicture: userCredentials.user!.photoURL ?? '',
          );
          // Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: "Data not saved",
          message:
          'Something went wrong while saving user information. You can re -save your data in your Profile');
    }
  }

  ///Delete User Account warning
  void deleteAccountWarningPopup() async {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText:
      'Are you sure you want to delete your account permanently? This action is not reversible and all your data will be remove permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(
            color: Colors.red,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: TSizes.lg,
          ),
          child: Text(
            'Delete',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      cancel: OutlinedButton(
          onPressed: () async =>
              Navigator.of(
                Get.overlayContext!,
              ).pop(),
          child: const Text('Cancel')),
    );
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          "We are processing your request...", TImages.docerAnimation);

      ///First re-authenticate the user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!
              .providerData
              .map((e) => e.providerId)
              .first;
      if (provider.isNotEmpty) {
        //re verify Auth Email
        if (provider == 'google.com') {
          await auth.googleSignIn();
          await auth.deleteAccount();
          // await    localStorage.remove("REMEMBER_ME_EMAIL");
          //    localStorage.remove("REMEMBER_ME_PASSWORD");
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  /// RE-Authenticate Email and Password
  Future<void> reAuthenticateEmailAndPassword() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          "We are processing your request...", TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //Re-Authenticate User
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  ///Upload Profile Image Here
  uploadProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;

        /// upload image
        final imageUrl =
        await userRepository.uploadImage("Users/images/profile/", image);

        /// Update User Image Record
        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(
            title: "Image Uploaded",
            message: "Your profile picture has been updated successfully.");
      }
    } catch (e) {
      print(e);
      TLoaders.errorSnackBar(
          title: "Oh Snap!", message: "Something went wrong: $e");
    } finally {
      imageUploading.value = false;
    }
  }

}