

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///DropDown
        DropdownButtonFormField(
          focusColor: Colors.white,
          hint: const Text("All Products"),
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.filter)),
          items: [
            "Name",
            "Higher Price",
            "Lower Price",
            "Sale",
            "Newest",
            "Popularity"
          ].map((option) {
            return DropdownMenuItem(
              value: option,

              child: Text(option),
            );
          }).toList(),
          onChanged: (value) {},
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        ///Products
        TGridLayout(
          itemCount: 6,
          itemBuilder: (_, __) {
            return TProductCardVertical(
                product: ProductModel(
                  id: "1",
                  title: "Product ",
                  thumbnail:TImages.productImage17,
                  price: 100,
                  stock: 10, salePrice: 9900, productType: 'simple',
                )
            );
          },
        )
      ],
    );
  }
}