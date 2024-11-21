import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../data/data/dummy_data.dart';
import '../../../../../data/repositories/banners/banners_repository.dart';
import '../../../../../data/repositories/category/category_repository.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';


class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryRepository categoryRepo = Get.put(CategoryRepository());
    final bannersRepo = Get.put(BannersRepository());
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Upload Data'),
        showArrowBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: <Widget>[
            const TSectionHeading(
              title: "Main Record",
            ),
            const SizedBox(height: TSizes.sm),
            const TMenuTile(
              icon: Iconsax.category,
              title: "My Addresses",
            ),
            const TMenuTile(
              icon: Iconsax.shop,
              title: "Upload Brands",
            ),
            const TMenuTile(
              icon: Iconsax.shopping_cart,
              title: "Upload Products",
            ),
            TMenuTile(
              icon: Iconsax.image,
              title: "Upload Banners",
              onTap: () async {
                await _uploadBannerData(bannersRepo);
              },
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            const TSectionHeading(
              title: "Relationships",
            ),
            const Text("Make sure you have already uploaded all the content above"),
            const SizedBox(height: TSizes.spaceBtwItems),
            TMenuTile(
              icon: Iconsax.link,
              title: "Upload Brands & Categories Relation Data",
              onTap: () async {
                // Trigger the upload process
                await _uploadCategoryData(categoryRepo);
              },
            ),
            const TMenuTile(
              icon: Iconsax.link,
              title: "Upload Products & Categories Relation Data",
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _uploadCategoryData(CategoryRepository repository) async {
    try {
      // Display a loading dialog
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false,
      );

      // Upload dummy category data
      await repository.uploadDummyData(TDummyData.categories);

      // Close the loading dialog
      Get.back();

      // Show success message
      Get.snackbar(
        "Success",
        "Categories uploaded successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      // Close the loading dialog
      Get.back();

      // Show error message
      Get.snackbar(
        "Error",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
Future<void> _uploadBannerData(BannersRepository repository) async {
  try {
    // Show a loading dialog
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );

    // Upload dummy banner data
    await repository.uploadBanners(TDummyData.banners);

    // Close the loading dialog
    Get.back();

    // Show success message
    Get.snackbar(
      "Success",
      "Banners uploaded successfully!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  } catch (error) {
    // Close the loading dialog
    Get.back();

    // Show error message
    Get.snackbar(
      "Error",
      error.toString(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}

class TMenuTile extends StatelessWidget {
  const TMenuTile({super.key, required this.icon, required this.title, this.onTap});
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: TColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      trailing: const Icon(Iconsax.arrow_circle_up, color: TColors.primary, size: TSizes.iconMd),
      onTap: onTap,
    );
  }
}
