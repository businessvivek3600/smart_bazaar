import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_bazar/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:smart_bazar/features/shop/screens/checkout/checkout_screen.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showArrowBack: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(
          TSizes.defaultSpace,
        ),
        child: TCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: const Text("Checkout ₹12000.00")),
      ),
    );
  }
}
