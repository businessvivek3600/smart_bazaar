import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_bazar/features/personalization/controllers/update_name_controller.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';
import 'package:smart_bazar/utils/constants/text_strings.dart';
import 'package:smart_bazar/utils/validators/validation.dart';

import '../../../../../common/widgets/appbar/appbar.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
        appBar: TAppBar(
          title: Text(
            'Change Name',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Heading
              Text(
                'Use real name for easy verification. This name will appear on several pages.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// TextFields and buttons
              Form(
                  key: controller.updateUserNameFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.firstNameController,
                        validator: (value) => TValidator.validateEmptyText("First Name", value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: TTexts.firstName,
                            prefixIcon: Icon(Iconsax.user)),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      TextFormField(
                        controller: controller.lastNameController,
                        validator: (value) => TValidator.validateEmptyText("Last Name", value),
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: TTexts.lastName,
                            prefixIcon: Icon(Iconsax.user)),
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => controller.updateUserName(),
                          child: Text(
                            'Save',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}
