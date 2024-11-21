

import 'package:get/get.dart';
import 'package:smart_bazar/data/repositories/banners/banners_repository.dart';
import 'package:smart_bazar/features/shop/models/banner_model.dart';

import '../../../utils/popops/loaders.dart';

class BannerController extends GetxController {
  ///variable
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;

  RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// Update page indicator
  void updatePageIndicator(int index) {
    carousalCurrentIndex.value = index;
  }

  /// fetch Banners
  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;

      final bannerRepo = Get.put(BannersRepository());
      final banners = await bannerRepo.fetchBanners();

      // Print the fetched banners
      print("Fetched banners: ${banners.map((banner) => banner.imageUrl).toList()}");// Debugging

      this.banners.assignAll(banners.cast<BannerModel>());

      // Print the RxList after assignment
      print("RxList banners: ${this.banners.length}");
    } catch (e) {
      print("Error fetching banners: $e");
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

}
