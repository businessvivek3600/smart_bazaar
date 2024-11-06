import 'package:flutter/material.dart';
import 'package:smart_bazar/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:smart_bazar/common/widgets/texts/section_heading.dart';
import 'package:smart_bazar/utils/constants/colors.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          showActionButton: true,
          onPressed: () {},
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const Image(
                image: AssetImage(TImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text("Paypal",style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}
