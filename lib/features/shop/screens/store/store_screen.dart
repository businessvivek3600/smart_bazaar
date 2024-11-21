import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_bazar/common/widgets/appbar/appbar.dart';
import 'package:smart_bazar/common/widgets/appbar/tab_bar.dart';
import 'package:smart_bazar/common/widgets/custome_search_bar/custome_search_bar.darrt.dart';
import 'package:smart_bazar/common/widgets/layout/grid_layout.dart';
import 'package:smart_bazar/common/widgets/texts/section_heading.dart';
import 'package:smart_bazar/features/shop/controllers/category_controller.dart';
import 'package:smart_bazar/features/shop/screens/brand/all_brands.dart';

import 'package:smart_bazar/utils/constants/sizes.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import 'widget/category_tab.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final double expandedHeight = screenHeight * 0.45;
    final categories= CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(
              iconColor: dark ? Colors.white : Colors.black,
              onPressed: () {},
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                expandedHeight: expandedHeight,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ///---SearchBar
                      const TSearchBar(
                        text: "Search in Store",
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// --- Featured Brand
                      TSectionHeading(
                        title: "Featured Brand",
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                        showActionButton: true,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),
                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,

                        itemBuilder: (_, index) {
                          return const TBrandCard(
                            showBorder: true,
                          );
                        },
                      )
                    ],
                  ),
                ),
                bottom: TTabBar(tabs:
                  categories.map((e) => Tab(text: e.name)).toList()
                ),
              ),
            ];
          },
          body:  TabBarView(
            children: categories.map((category) => TCategoryTab(category: category,)).toList(),
          ),
        ),
      ),
    );
  }
}
