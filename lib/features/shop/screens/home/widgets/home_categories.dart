import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_bazar/common/widgets/shimmers/category_shimmer.dart';
import 'package:smart_bazar/common/widgets/shimmers/shimmer.dart';
import 'package:smart_bazar/features/shop/controllers/category_controller.dart';
import 'package:smart_bazar/features/shop/sub_category/sub_category.dart';
import 'package:smart_bazar/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/vertical_image_container/vertical_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Obx(() {
      if (controller.isLoading.value) return const TCategoryShimmer();
      if (controller.featuredCategories.isEmpty) {
        return Center(
            child: Text(
          "No Data Found!",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: Colors.white),
        ));
      }

      return SizedBox(
        height: THelperFunctions.screenHeight() * 0.11,
        child: ListView.builder(
          itemCount: controller.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = controller.featuredCategories[index];
            return TVerticalImageText(
                textColor: TColors.white,
                image: category.image.isNotEmpty ? category.image  :  TImages.acerlogo,
                title: category.name,
                backgroundColor: TColors.white,
                onTap: () => Get.to(() => const SubCategoryScreen()));
          },
        ),
      );
    });
  }
}
