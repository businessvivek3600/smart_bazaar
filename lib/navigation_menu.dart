import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_bazar/features/personalization/screens/settings/setting_screen.dart';
import 'package:smart_bazar/features/shop/screens/home/home.dart';
import 'package:smart_bazar/features/shop/screens/wishList/favourite_screen.dart';
import 'package:smart_bazar/utils/helpers/helper_functions.dart';

import 'features/shop/screens/store/store_screen.dart';
import 'utils/constants/colors.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () =>
         NavigationBar(
          height: 80,
          elevation: 2,
          selectedIndex: controller.selectedIndex.value,
          backgroundColor: dark ?TColors.black :TColors.white,
          indicatorColor: dark ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),

          ],
        ),
      ),
body: Obx(
() =>  controller.screens[
    controller.selectedIndex.value
  ],
),
    );
  }
}


class NavigationController extends GetxController{
  Rx<int> selectedIndex = 0.obs;
  final screens = [
   const HomeScreen(),
    const StoreScreen(),
   const FavouriteScreen(),
    const SettingScreen(),
  ];
}