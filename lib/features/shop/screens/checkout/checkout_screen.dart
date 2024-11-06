import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_bazar/common/widgets/appbar/appbar.dart';
import 'package:smart_bazar/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:smart_bazar/common/widgets/success_screen/success_screen.dart';
import 'package:smart_bazar/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:smart_bazar/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:smart_bazar/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:smart_bazar/navigation_menu.dart';
import 'package:smart_bazar/utils/constants/colors.dart';
import 'package:smart_bazar/utils/constants/image_strings.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';
import 'package:smart_bazar/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';
import 'widgets/billing_address_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: TAppBar(
          showArrowBack: true,
          title: Text(
            "Order Review",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                ///--Items in Cart
                const TCartItems(
                  showAddRemoveButton: false,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                ///-- Coupon TextField
                const TCouponCode(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                ///--BillingSection
                TRoundedContainer(
                  showBorder: true,
                  padding: const EdgeInsets.all(TSizes.md),
                  backgroundColor: dark ? TColors.black : TColors.white,
                  child: const Column(
                    children: [
                      ///Pricing
                      TBillingAmountSection(),
                      SizedBox(height: TSizes.spaceBtwItems),

                      ///Divider
                      Divider(),
                      SizedBox(height: TSizes.spaceBtwItems),

                      ///Payment Methods
                      TBillingPaymentSection(),
                      SizedBox(height: TSizes.spaceBtwItems),

                      ///Address
                      TBillingAddressSection(),
                      SizedBox(height: TSizes.spaceBtwItems),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
              onPressed: () => Get.to(() => SuccessScreen(
                    image: TImages.successfulPaymentIcon,
                    title: 'Payment Success!',
                    subTitle: 'Your item will be shipped soon!',
                    onPressed: () => Get.to(() => const NavigationMenu()),
                  )),
              child: const Text("Make a Payment")),
        ));
  }
}
