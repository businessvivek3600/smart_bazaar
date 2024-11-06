import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:smart_bazar/common/widgets/texts/section_heading.dart';
import 'package:smart_bazar/features/shop/screens/checkout/checkout_screen.dart';
import 'package:smart_bazar/features/shop/screens/product_deatils/widget/bottom_add_to_cart_widget.dart';
import 'package:smart_bazar/features/shop/screens/product_deatils/widget/product_attributes.dart';
import 'package:smart_bazar/features/shop/screens/product_deatils/widget/product_meta_data.dart';
import 'package:smart_bazar/features/shop/screens/product_review/product_reviews.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';
import 'package:smart_bazar/utils/helpers/helper_functions.dart';

import 'widget/rating_share_widget.dart';
import 'widget/product_image_slider.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1- Product Image Slider
            const TProductImageSlider(),

            /// 2- Product Details
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// -Rating & share
                  const TRatingAndShare(),

                  ///-Price ,Title,Stock & Brand
                  const TProductMetaData(),

                  ///--Attributes
                  const TProductAttributes(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///--Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text("CheckOut"),
                      onPressed:() => Get.to(() => const CheckoutScreen()),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///-Description
                  const TSectionHeading(title: "Description"),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    "Elevate your casual wardrobe with this stylish Nike T-shirt. Crafted from soft, breathable fabric, it offers all-day comfort and a relaxed fit. Featuring the iconic Nike logo, this tee combines sporty flair with versatility, making it perfect for workouts or everyday wear. Available in a range of colors, it’s a must-have for any active lifestyle.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show More',
                    trimExpandedText: "Show Less",
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  ///- Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TSectionHeading(
                          title: "Reviews (199)",
                          showActionButton: false,
                        ),
                        IconButton(
                            onPressed: () {
                              Get.to(const ProductReviewsScreen());
                            },
                            icon: const Icon(
                              Iconsax.arrow_right_3,
                              size: 18,
                            ))
                      ]),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
