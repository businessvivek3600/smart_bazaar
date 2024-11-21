import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_bazar/common/widgets/shimmers/shimmer.dart';
import 'package:smart_bazar/features/shop/controllers/banner_controller.dart';
import 'package:smart_bazar/utils/constants/colors.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/t_rounded_images.dart';
import '../../../../../utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const TShimmerEffect(width: double.infinity, height: 190);
      }
      if (controller.banners.isEmpty) {
        return const Text('No Data found');
      }
      return Column(
        children: [
          CarouselSlider(
            items: controller.banners
                .map((e) => TRoundedImage(
                      imageUrl: e.imageUrl,
                      applyImageRadius: true,
                      isNetworkImage: true,
                      onPressed: () => Get.toNamed(e.targetScreen),
                    ))
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < controller.banners.length; i++)
                TCircularContainer(
                  width: 20,
                  height: 4,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: i == controller.carousalCurrentIndex.value
                      ? TColors.primary
                      : Colors.grey, // Use .value to access the current index
                ),
            ],
          ),
        ],
      );
    });
  }
}
// create a ProductModel like Category Model that contain these Parameters
// String id; int Stock;String? sku ; double price;string title;DateTime? date;double salePrice;String thumbnail;bool? isFeatured;BrandModel? model;String? Description;String?categoryId;List<String>? images;String productType;List<ProductAttributeModel>? productAttributes;List<ProductVariationModel>? productVariation;