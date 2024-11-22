import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';

import '../../models/product_model.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  ///Variables
  RxString selectedProductImage = ''.obs;

  ///---Get All Images from product and Variation
  List<String> getAllImages(ProductModel product) {
    //use Set to add unique images only
    Set<String> images = {};

    // Load thumbnail image
    images.add(product.thumbnail);
    // Assign Thumbnail as the selected image
    selectedProductImage.value = product.thumbnail;

    // Load all product images
    if (product.images != null) {
      images.addAll(product.images!);
    }

    // Load all variation images
    if (product.productVariation != null ||
        product.productVariation!.isNotEmpty) {
      images.addAll(product.productVariation!.map((e) => e.image));
    }
    return images.toList();
  }

  ///---Set Selected Image
  void setEnlargedImage(String image) {
   Get.to(
     fullscreenDialog: true,
       () => Dialog.fullscreen(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisSize: MainAxisSize.min,
           children: [
             Padding(
               padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace ,vertical: TSizes.defaultSpace * 2),
               child: CachedNetworkImage(imageUrl: image),
             ),
            SizedBox(height: TSizes.spaceBtwSections,),
             Align(
               alignment: Alignment.bottomCenter,
               child: SizedBox(
                 width: 150,
                 child: OutlinedButton(
                   onPressed: () => Get.back(),
                   child: const Text("Close"),
                 ),
               ),
             )
           ],
         ),
       ),
   );
  }
}
