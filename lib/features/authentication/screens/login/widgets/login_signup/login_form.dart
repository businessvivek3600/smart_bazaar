import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_bazar/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:smart_bazar/features/authentication/screens/sign_up/signup_screen.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';
import 'package:smart_bazar/utils/validators/validation.dart';

import '../../../../../../utils/constants/text_strings.dart';
import '../../../../controllers/login/login_controller.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final FocusNode passwordFocusNode = FocusNode();
    return Form(
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///Email
          TextFormField(
            controller: controller.email,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(passwordFocusNode); // Move focus to password
            },
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: TTexts.email,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
//TValidator.validateEmptyText("Password", value),
          ///Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              focusNode: passwordFocusNode, // Set focus node
              textInputAction: TextInputAction.done, // Show "Done" button
              onFieldSubmitted: (value) {
                FocusScope.of(context)
                    .unfocus(); // Dismiss the keyboard when done
              },
              obscureText: controller.hidePassword.value,
              validator: (value) =>
                  TValidator.validateEmptyText("Password", value),
              decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: controller.hidePasswordFunction,
                  icon: controller.hidePassword.value
                      ? const Icon(Iconsax.eye_slash)
                      : const Icon(Iconsax.eye),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: TSizes.spaceBtwInputFields / 3,
          ),

          ///Remember Me & Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ///Remember me
                  Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                      )),
                  const Text(TTexts.rememberMe),
                ],
              ),

              ///Forget  Password
              TextButton(
                  onPressed: () {
                    Get.to(() => const ForgetPassword());
                  },
                  child: const Text(TTexts.forgetPassword)),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          ///Sign In Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () =>  controller.emailAndPasswordLogin(),
              child: const Text(
                TTexts.signIn,
              ),
            ),
          ),

          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          ///Create Account Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Get.to(() => const SignupScreen());
              },
              child: const Text(
                TTexts.createAccount,
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
