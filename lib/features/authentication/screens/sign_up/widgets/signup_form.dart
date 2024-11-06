import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_bazar/features/authentication/controllers/signup/signup_controller.dart';
import 'package:smart_bazar/features/authentication/screens/sign_up/widgets/terms_conditions_checkbox.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';
import 'package:smart_bazar/utils/constants/text_strings.dart';
import 'package:smart_bazar/utils/validators/validation.dart';

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    // Define FocusNodes for each TextFormField
    final FocusNode firstNameFocusNode = FocusNode();
    final FocusNode lastNameFocusNode = FocusNode();
    final FocusNode usernameFocusNode = FocusNode();
    final FocusNode emailFocusNode = FocusNode();
    final FocusNode phoneFocusNode = FocusNode();
    final FocusNode passwordFocusNode = FocusNode();

    return Form(
      key: controller.signUpKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  focusNode: firstNameFocusNode, // Set focus node
                  textInputAction: TextInputAction.next, // Show "Next" button
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(lastNameFocusNode); // Move focus to last name
                  },
                  validator: (value) =>
                      TValidator.validateEmptyText("First name", value),
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  focusNode: lastNameFocusNode, // Set focus node
                  textInputAction: TextInputAction.next, // Show "Next" button
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(usernameFocusNode); // Move focus to username
                  },
                  validator: (value) =>
                      TValidator.validateEmptyText("Last name", value),
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.userName,
            focusNode: usernameFocusNode, // Set focus node
            textInputAction: TextInputAction.next, // Show "Next" button
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(emailFocusNode); // Move focus to email
            },
            validator: (value) =>
                TValidator.validateEmptyText("Username", value),
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.email,
            focusNode: emailFocusNode, // Set focus node
            textInputAction: TextInputAction.next, // Show "Next" button
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(phoneFocusNode); // Move focus to phone number
            },
            keyboardType: TextInputType.emailAddress,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.]'))],
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            validator: (value) => TValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            focusNode: phoneFocusNode, // Set focus node
            textInputAction: TextInputAction.next, // Show "Next" button
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(passwordFocusNode); // Move focus to password
            },
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),  ],
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          Obx(() => TextFormField(
            controller: controller.password,
            focusNode: passwordFocusNode, // Set focus node
            textInputAction: TextInputAction.done, // Show "Done" button
            onFieldSubmitted: (value) {
              FocusScope.of(context).unfocus(); // Dismiss the keyboard when done
            },
            obscureText: controller.hidePassword.value,
            validator: (value) => TValidator.validatePassword(value),
            decoration: InputDecoration(
              labelText: TTexts.password,
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                onPressed: () {
                  controller.hidePassword.value =
                  !controller.hidePassword.value;
                },
                icon: controller.hidePassword.value ? const Icon(Iconsax.eye_slash) : const Icon(Iconsax.eye),
              ),
            ),
          ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),
          const TTermAndConditionCheckBox(),
          const SizedBox(height: TSizes.spaceBtwSections),

          ///Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(
                TTexts.createAccount,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
