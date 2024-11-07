import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:smart_bazar/data/repositories/user/user_repository.dart';
import 'package:smart_bazar/utils/popops/loaders.dart';

import '../../../Model/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
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
    } finally{
      userProfileLoading.value = false;
    }
  }

  /// Save user Record from any registration Provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        //Convert Name to first and last name
        final nameParts =
            UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final userName =
            UserModel.generateUserName(userCredentials.user!.displayName ?? '');

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
    } catch (e) {
      TLoaders.warningSnackBar(
          title: "Data not saved",
          message:
              'Something went wrong while saving user information. You can re -save your data in your Profile');
    }
  }
}
