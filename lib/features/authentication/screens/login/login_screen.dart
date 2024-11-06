import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_bazar/common/styles/spacing_style.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/login_signup/login_form.dart';
import 'widgets/login_signup/login_header.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Logo ,Title & Subtitle
              const TLoginHeader(),

              ///Form
              const TLoginForm(),

              ///Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Footer Social Login........
              const TSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
