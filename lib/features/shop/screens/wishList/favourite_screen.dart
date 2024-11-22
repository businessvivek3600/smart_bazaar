import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_bazar/common/widgets/appbar/appbar.dart';
import 'package:smart_bazar/common/widgets/icons/t_circular_icon.dart';
import 'package:smart_bazar/common/widgets/layout/grid_layout.dart';
import 'package:smart_bazar/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:smart_bazar/features/shop/screens/home/home.dart';
import 'package:smart_bazar/features/shop/screens/product_deatils/product_details.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../models/product_model.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "WishList",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => TProductCardVertical(
                  product: ProductModel(
                    id: "1",
                    title: "Product $index",
                    thumbnail:TImages.productImage17,
                    price: 100,
                    stock: 10, salePrice: 9900, productType: 'simple',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
