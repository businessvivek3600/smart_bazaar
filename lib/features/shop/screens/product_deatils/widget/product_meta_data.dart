import 'package:flutter/material.dart';
import 'package:smart_bazar/common/widgets/images/t_circular_image.dart';
import 'package:smart_bazar/common/widgets/texts/product_title_text.dart';
import 'package:smart_bazar/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:smart_bazar/utils/constants/enums.dart';
import 'package:smart_bazar/utils/constants/image_strings.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            ///Sale Tag
            TRoundedContainer(
              showBorder: false,
              borderRadius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                "25%",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            ///Price
            Text(
              '₹1,999',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: TSizes.sm),
            Text(
              '₹1499.25',
              style: Theme.of(context).textTheme.titleSmall!,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///-Title
        const TProductTitleText(title: "Blue Nike Sports Shirt"),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///-Stock Product
        Row(
          children: [
            const TProductTitleText(title: "Status"),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        ///-Brand
        Row(
          children: [
            TCircularImage(
              image: TImages.nikeLogo,
              width: 32,
              height: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            const TBrandTitleWithVerifiedIcon(
              title: "Nike",
              brandTextSizes: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
