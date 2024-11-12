import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';
import 'package:smart_bazar/utils/constants/text_strings.dart';
import 'package:smart_bazar/utils/validators/validation.dart';

import '../../../controllers/user_controller.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final emailFocusNode = FocusNode();
    final passwordFocusNode = FocusNode();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Re-Authenticate User"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  focusNode: emailFocusNode,
                  textInputAction: TextInputAction.next,
                  validator: TValidator.validateEmail,
                  decoration: const InputDecoration(
                    labelText: TTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                  onFieldSubmitted: (value) {
                    // Move focus to the password field
                    FocusScope.of(context).requestFocus(passwordFocusNode);
                  },
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Obx(
                      () => TextFormField(
                    controller: controller.verifyPassword,
                    focusNode: passwordFocusNode,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value) {
                      // Trigger the button action when "Done" is pressed on the password field
                      controller.reAuthenticateEmailAndPassword();
                    },
                    obscureText: controller.hidePassword.value,
                    validator: (value) =>
                        TValidator.validateEmptyText("Password", value),
                    decoration: InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                        icon: controller.hidePassword.value
                            ? const Icon(Iconsax.eye_slash)
                            : const Icon(Iconsax.eye),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.reAuthenticateEmailAndPassword(),
                    style: ElevatedButton.styleFrom(),
                    child: const Text("Verify"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

