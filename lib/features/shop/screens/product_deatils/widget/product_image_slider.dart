


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../common/widgets/images/t_rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../models/product_model.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    required this.product});
  final ProductModel product;


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: Get.height * 0.4,
              child:Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 3),
                child: Center(
                  child: Image(
                    image: AssetImage(product.thumbnail),
                  ),
                ),
              ),
            ),

            /// Image Slider...
            Positioned(
              bottom: 30,
              left: TSizes.defaultSpace,
              right: 0,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return TRoundedImage(
                        imageUrl: TImages.productImage3,
                        width: 80,
                        border: Border.all(color: TColors.primary),
                        padding: const EdgeInsets.all(TSizes.sm),
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(
                      width: TSizes.spaceBtwItems ,
                    ),
                    itemCount: 6),
              ),
            ),

            ///--AppBar Icons
            const TAppBar(
              showArrowBack: true,
              actions: [
                TCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}