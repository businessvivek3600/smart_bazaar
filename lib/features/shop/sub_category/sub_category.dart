import 'package:flutter/material.dart';
import 'package:smart_bazar/common/widgets/images/t_rounded_images.dart';
import 'package:smart_bazar/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:smart_bazar/common/widgets/texts/section_heading.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../utils/constants/image_strings.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Sports '),
        showArrowBack: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              ///--Bonner
              const TRoundedImage(
                imageUrl: TImages.promoBanner2,
                applyImageRadius: true,
                width: double.infinity,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Sub_categories
              Column(
                children: [
                  /// Heading
                  TSectionHeading(
                    title: "Sports shirts",
                    onPressed: () {},
                    showActionButton: true,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 130,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: TSizes.spaceBtwItems),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) => TProductCardHorizontal(
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
