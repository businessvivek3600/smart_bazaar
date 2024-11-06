import 'package:flutter/material.dart';
import 'package:smart_bazar/common/widgets/texts/product_price_text.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';
import 'package:smart_bazar/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/t_cart_item.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,  this.showAddRemoveButton = true,
  });
  final bool showAddRemoveButton ;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, __) {
          return Column(
            children: [
              const TCartItem(),
              if (showAddRemoveButton == true)
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
              if (showAddRemoveButton == true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///Add Remove button
                    Row(
                      children: [
                        SizedBox(
                          width: THelperFunctions.screenWidth() * 0.17,
                        ),
                        const TProductQuantityWithAddRemoveButton(),
                      ],
                    ),
                    const TProductPriceText(price: "2000.00")
                  ],
                ),
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
        itemCount: 2);
  }
}
