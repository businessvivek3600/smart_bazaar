import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_bazar/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:smart_bazar/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:smart_bazar/features/shop/screens/home/widgets/home_categories.dart';
import 'package:smart_bazar/utils/constants/image_strings.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';
import '../../../../common/widgets/custome_search_bar/custome_search_bar.darrt.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../controllers/product/product_controller.dart';
import '../all_products/all_products.dart';
import '../product_deatils/product_details.dart';
import 'widgets/home_appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          ///Header from primary_header
          const TPrimaryHeaderContainer(
            child: Column(
              children: [
                ///AppBar

                THomeAppBar(),
                SizedBox(height: TSizes.spaceBtwSections),

                ///Search Bar
                TSearchBar(
                  text: "Search in Store",
                  icon: Iconsax.search_normal,
                  padding:
                      EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                ),
                SizedBox(height: TSizes.spaceBtwSections),

                ///----Categories----
                Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      TSectionHeading(
                        title: "Popular Categories",
                        showActionButton: false,
                        onPressed: null,
                        textColor: TColors.white,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems),
                      THomeCategories(),
                      SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          ///Body...
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                ///Promo Slider....
                TPromoSlider(),
                const SizedBox(height: TSizes.spaceBtwSections),
                TSectionHeading(
                  title: "Popular Products",
                  showActionButton: true,
                  onPressed: () => Get.to(() => const AllProducts()),
                ),

                ///Popular Products
                Obx(() {
                  if(controller.isLoading.value){
                    return const TVerticalProductShimmer();
                  }
                  if(controller.allProducts.isEmpty){
                    return  Center(child: Text("No Products Found",style: Theme.of(context).textTheme.bodyMedium,));
                  }
                  return TGridLayout(
                      itemCount: controller.allProducts.length,
                      itemBuilder: (p0, index) => TProductCardVertical(
                        product: controller.allProducts[index],
                          ),
                      mainAxisExtent: 290);
                }),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
