import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_bazar/common/widgets/images/t_rounded_images.dart';
import 'package:smart_bazar/common/widgets/texts/product_title_text.dart';
import 'package:smart_bazar/features/shop/controllers/product/product_controller.dart';
import 'package:smart_bazar/features/shop/models/product_model.dart';
import 'package:smart_bazar/utils/constants/enums.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';
import 'package:smart_bazar/utils/helpers/helper_functions.dart';

import '../../../../features/shop/screens/product_deatils/product_details.dart';
import '../../../../utils/constants/colors.dart';
import '../../../styles/shadow.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/t_circular_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/t_brand_title_text_with_verified_icon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercent =
        controller.calculateSalePercentage(product.price, product.salePrice);
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetail(product: product));
      },
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkerGrey : TColors.white),
        child: Column(children: [
          ///Thumbnail, wishList,button,Discount Tag
          TRoundedContainer(
            showBorder: false,
            height: 180,
            width: 180,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(children: [
              ///--Product Image
              TRoundedImage(
                imageUrl: product.thumbnail,
                applyImageRadius: true,
                isNetworkImage: true,
              ),

              ///--Sale Tag
              Positioned(
                top: 12,
                child: TRoundedContainer(
                  showBorder: false,
                  borderRadius: TSizes.sm,
                  backgroundColor: TColors.secondary.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.sm, vertical: TSizes.xs),
                  child: Text(
                    "$salePercent%",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.black),
                  ),
                ),
              ),

              ///--Favourite Icon button
              const Positioned(
                  top: 0,
                  right: 0,
                  child: TCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ))
            ]),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems / 2,
          ),

          ///
          Padding(
            padding: const EdgeInsets.only(left: TSizes.sm),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  TBrandTitleWithVerifiedIcon(
                    title: product.model!.name,
                  ),
                ],
              ),
            ),
          ),

          ///Spacer
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  children: [
                    if (product.productType == ProductType.single.toString() &&
                        product.salePrice > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: TSizes.sm),
                        child: Text(
                          product.price.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(decoration: TextDecoration.lineThrough),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: TSizes.sm),
                      child: TProductPriceText(
                        price: controller.getProductPrice(product),
                        isLarge: false,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    )),
                child: const SizedBox(
                    height: TSizes.iconLg * 1.2,
                    width: TSizes.iconLg * 1.2,
                    child:
                        Center(child: Icon(Iconsax.add, color: TColors.white))),
              )
            ],
          )
        ]),
      ),
    );
  }
}
