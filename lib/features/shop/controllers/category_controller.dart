import 'package:get/get.dart';
import 'package:smart_bazar/utils/constants/image_strings.dart';
import 'package:smart_bazar/utils/constants/text_strings.dart';
import 'package:smart_bazar/utils/popops/full_screen_loader.dart';
import 'package:smart_bazar/utils/popops/loaders.dart';

import '../../../data/repositories/category/category_repository.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// --Load Category data
  Future<void> fetchCategories() async {
    try {
      //show loader while loading  categories
      isLoading.value = true;

      //fetch categories  from data source (FireStore,Api,etc.)
      final categories = await _categoryRepository.getAllCategories();

      //update the list of categories
      allCategories.assignAll(categories);

      // Filter featured categories

      featuredCategories.assignAll(allCategories.where((element) => element.isFeatured && element.parentId.isEmpty).take(10).toList());


      // //Loader
      // TFullScreenLoader.openLoadingDialog(
      //     "Loading Categories", TImages.docerAnimation);
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      // TFullScreenLoader.stopLoading();
      isLoading.value = false;
    }
  }
}
