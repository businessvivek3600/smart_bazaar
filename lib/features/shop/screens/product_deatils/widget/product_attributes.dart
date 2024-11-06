import 'package:flutter/material.dart';
import 'package:smart_bazar/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:smart_bazar/common/widgets/texts/product_price_text.dart';
import 'package:smart_bazar/common/widgets/texts/product_title_text.dart';
import 'package:smart_bazar/common/widgets/texts/section_heading.dart';
import 'package:smart_bazar/utils/constants/colors.dart';
import 'package:smart_bazar/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        ///--Selected Attribute Pricing & Descripton
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              /// Title,Price and Stock
              Row(
                children: [
                  const TSectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          /// Actual Price
                          const TProductTitleText(
                            title: "Price : ",
                            smallSize: true,
                          ),
                          Text(' ₹1,999',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough)),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          const TProductPriceText(
                            price: '1499.25',
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(
                            title: "Stock : ",
                            smallSize: true,
                          ),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),

              ///Variation Description
              const TProductTitleText(
                title:
                    'The product is tagless to provide a smooth surface and minimises any irritation',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        ///--Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              title: "Colors",
              showActionButton: true,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  title: 'Blue',
                  selected: true,
                  onSelected: (p0) {},
                ),
                TChoiceChip(
                  title: 'Green',
                  selected: false,
                  onSelected: (p0) {},
                ),
                TChoiceChip(
                  title: 'Yellow',
                  selected: false,
                  onSelected: (p0) {},
                ),

              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              title: "Size",
              showActionButton: true,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
           Wrap(
             spacing: 8,
             children: [
               TChoiceChip(
                 title: 'EU 32',
                 selected: true,
                 onSelected: (p0) {},
               ),
               TChoiceChip(
                 title: 'EU 34',
                 selected: false,
                 onSelected: (p0) {},
               ),
               TChoiceChip(
                 title: 'EU 36',
                 selected: false,
                 onSelected: (p0) {},
               ),
             ],
           )
          ],
        )
      ],
    );
  }
}
