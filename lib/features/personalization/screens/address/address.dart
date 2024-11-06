import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_bazar/common/widgets/appbar/appbar.dart';
import 'package:smart_bazar/features/personalization/screens/address/add_new_address.dart';
import 'package:smart_bazar/features/personalization/screens/address/widgets/single_address.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showArrowBack: true,
        title: Text(
          "Addresses",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              TSingleAddress(selectedAddress: false),
              TSingleAddress(selectedAddress:true),
              TSingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
