import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_bazar/common/widgets/appbar/appbar.dart';
import 'package:smart_bazar/common/widgets/brands/brand_card.dart';
import 'package:smart_bazar/common/widgets/layout/grid_layout.dart';
import 'package:smart_bazar/common/widgets/texts/section_heading.dart';
import 'package:smart_bazar/features/shop/screens/brand/brand_products.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Brand"),
        showArrowBack: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        ///Heading
            const TSectionHeading(title: "Brands"),
            const SizedBox(height: TSizes.spaceBtwItems,),
            ///--Brands
            TGridLayout(itemCount: 12, mainAxisExtent: 80,itemBuilder:(context, index) =>  TBrandCard(showBorder: true,onTap: () => Get.to(() => const BrandProducts()),),)
          ],
        ),
        ),
      ),
    );
  }
}
