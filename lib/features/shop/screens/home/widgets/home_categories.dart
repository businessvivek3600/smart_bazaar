import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return SizedBox(
      height: THelperFunctions.screenHeight() * 0.11,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return  TVerticalImageText(
            textColor: TColors.white,
            image: TImages.acerlogo,
            title: "Shoe",
            backgroundColor: TColors.white,
            onTap: () => Get.to(() =>  const SubCategoryScreen())
          );
        },
      ),
    );
  }
}
