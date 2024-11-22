import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_bazar/common/widgets/layout/grid_layout.dart';
import 'package:smart_bazar/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:smart_bazar/common/widgets/texts/section_heading.dart';
import 'package:smart_bazar/features/shop/models/category_model.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/product_model.dart';
import '../../product_deatils/product_details.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});
final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.sm),
          child: Column(
            children: [
              const TBrandShowCase(
                images: [
                  TImages.productImage3,
                  TImages.productImage2,
                  TImages.productImage1
                ],
              ),
              const TBrandShowCase(
                images: [
                  TImages.productImage3,
                  TImages.productImage2,
                  TImages.productImage1
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TSectionHeading(
                title: "You might like",
                showActionButton: true,
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) =>  TProductCardVertical(product: ProductModel(
                  id: "1",
                  title: "Product $index",
                  thumbnail:TImages.productImage17,
                  price: 100,
                  stock: 10, salePrice: 9900, productType: 'simple',
                )),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
