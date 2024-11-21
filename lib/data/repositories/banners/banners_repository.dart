import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smart_bazar/features/shop/models/banner_model.dart';


import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/cloud_storage/firebase_storage_service.dart';

class BannersRepository extends GetxController {
  static BannersRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;
  final _bannersCollection = 'banners';

  /// Getters

  /// Fetch Banners
  Future<List<BannerModel>> fetchBanners() async {
    try {
      Query query =
          _db.collection(_bannersCollection).where('active', isEqualTo: true);
      final querySnapshot = await query.get();

      return querySnapshot.docs
          .map((e) => BannerModel.fromSnapshot(e))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// Function to upload banners
  Future<void> uploadBanners(List<BannerModel> banners) async {
    try {
      final storage = Get.put(TFireBaseStorageService());

      for (var banner in banners) {
        // Get image file from local assets
        final file = await storage.getImageDataFromAssets(banner.imageUrl);

        // Upload image to Firebase Storage and get the URL
        final url =
            await storage.uploadImageData('Banners', file, banner.targetScreen);

        // Update the banner model with the image URL
        banner = BannerModel(
          imageUrl: url,
          targetScreen: banner.targetScreen,
          active: banner.active,
        );

        // Save banner to Firestore
        await _db.collection(_bannersCollection).add(banner.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
}
