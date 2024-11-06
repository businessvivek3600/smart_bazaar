import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_bazar/features/authentication/controllers/signup/signup_controller.dart';

import 'package:smart_bazar/utils/constants/colors.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';
import 'package:smart_bazar/utils/constants/text_strings.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class TTermAndConditionCheckBox extends StatelessWidget {
  const TTermAndConditionCheckBox({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
        ///Remember me
        SizedBox(
            height: 24,
            width: 24,
            child: Obx(() =>  Checkbox(value: controller.privacyPolicy.value, onChanged: (_) {
              controller.privacyPolicy.value =!controller.privacyPolicy.value;
            }))),
        const SizedBox(width: TSizes.spaceBtwItems),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: "${TTexts.iAgreeTo}  ",
                    style:
                    Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: "${TTexts.privacyPolicy}  ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                    color: dark
                        ? TColors.white
                        : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark
                        ? TColors.white
                        : TColors.primary,
                  ),
                ),
                TextSpan(
                    text: "${TTexts.and}  ",
                    style:
                    Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: "${TTexts.termsOfUse} ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                    color: dark
                        ? TColors.white
                        : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark
                        ? TColors.white
                        : TColors.primary,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}