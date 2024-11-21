import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_bazar/common/widgets/appbar/appbar.dart';
import 'package:smart_bazar/common/widgets/images/t_circular_image.dart';
import 'package:smart_bazar/common/widgets/shimmers/shimmer.dart';
import 'package:smart_bazar/common/widgets/texts/section_heading.dart';
import 'package:smart_bazar/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:smart_bazar/features/personalization/screens/profile/widgets/t_profile_menu.dart';
import 'package:smart_bazar/utils/constants/image_strings.dart';
import 'package:smart_bazar/utils/helpers/helper_functions.dart';
import 'package:smart_bazar/utils/popops/loaders.dart';

import '../../../../utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final user = controller.user.value;
    return Scaffold(
      appBar: const TAppBar(
        showArrowBack: true,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///--Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(
                      () {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : TImages.user;
                        if(controller.imageUploading.value){
                          return TShimmerEffect(width: 80, height: 80,radius: 80,);
                        }
                        return TCircularImage(
                          image: image,
                          width: 80,
                          height: 80,
                          isNetworkImage: networkImage.isNotEmpty,
                        );
                      },
                    ),
                    TextButton(
                      onPressed: () => controller.uploadProfilePicture(),
                      child: const Text("Change Profile Picture"),
                    ),
                  ],
                ),
              ),

              ///--Details...
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(
                title: "Profile Information",
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: "Name",
                value: user.fullName,
                onPressed: () {
                  Get.to(() => const ChangeName());
                },
              ),
              TProfileMenu(
                title: "username",
                value: user.username,
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Heading Personal Info
              const TSectionHeading(
                title: "Personal Information",
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: "User ID",
                value: user.id,
                icon: Iconsax.copy,
                onPressed: () {
                  // Copy the user ID to the clipboard
                  Clipboard.setData(ClipboardData(text: user.id));

                  // Show a snackBar message confirming the copy action
                  TLoaders.successSnackBar(
                    title: "Copied",
                    message: "User ID copied to clipboard",
                  );
                },
              ),
              TProfileMenu(
                title: "E-mail",
                value: user.email,
                onPressed: () {},
              ),
              TProfileMenu(
                title: "Phone Number",
                value: user.phoneNumber,
                onPressed: () {},
              ),
              TProfileMenu(
                title: "Gender",
                value: "Male",
                onPressed: () {},
              ),
              TProfileMenu(
                title: "Date of Birth",
                value: "30 Nov, 2001",
                onPressed: () {},
              ),

              ///--Delete Account Button
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text(
                      "Close Account",
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
