import 'package:get/get.dart';
import 'package:smart_bazar/utils/constants/enums.dart';
import 'package:smart_bazar/utils/popops/loaders.dart';

import '../../../../data/repositories/product/product_repository.dart';
import '../../models/product_model.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> allProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      print("Fetching products...");

      isLoading.value = true;
      final product = await productRepository.getAllCategories();
      allProducts.assignAll(product);
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  ///Get the product price or  price  range  of Variation
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      for (var variation in product.productVariation!) {
        double priceToConsider = variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price;
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
      if (smallestPrice == largestPrice) {
        return smallestPrice.toString();
      } else {
        return "$smallestPrice - $largestPrice";
      }
    }
  }


  /// --- Calculate Sale Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if(originalPrice <= 0.0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// --Check Product Stock Status
  String checkStockStatus(ProductModel product) {
    if (product.stock > 0) {
      return "In Stock";
    } else {
      return "Out of Stock";
    }
  }
}