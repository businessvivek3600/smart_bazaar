

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/controllers/login/login_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class TSocialButton extends StatelessWidget {
  const TSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignInFunction(),
            icon: Image.asset(
              TImages.google,
              width: TSizes.iconMd,
              height: TSizes.iconMd,
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              TImages.facebook,
              width: TSizes.iconMd,
              height: TSizes.iconMd,
            ),
          ),
        ),
      ],
    );
  }
}