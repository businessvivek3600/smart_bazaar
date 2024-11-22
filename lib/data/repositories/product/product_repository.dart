import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smart_bazar/data/services/cloud_storage/firebase_storage_service.dart';
import 'package:smart_bazar/features/shop/models/product_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  ///Variables
  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getAllCategories() async {
    try {
      final querySnapshot = await _db.collection('Products').where('IsFeatured',isEqualTo: true).get();
      final list = querySnapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();

      return list;
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



  ///Upload Categories to the cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // Get Firebase Storage service
      final storage = Get.put(TFireBaseStorageService());

      for (var product in products) {
        // Upload product thumbnail image to Firebase Storage
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        // Assign the uploaded thumbnail image URL to the product
        product.thumbnail = url;

        // Upload all product images to Firebase Storage
        List<String> uploadedImageUrls = [];
        for (var imagePath in product.images!) {
          final fileImage = await storage.getImageDataFromAssets(imagePath);
          final imageUrl = await storage.uploadImageData(
              'Products/Images', fileImage, imagePath);
          uploadedImageUrls.add(imageUrl);
        }
        product.images!.clear();
        product.images!.addAll(uploadedImageUrls);

        // Upload product data to Firestore
        await _db.collection('Products').doc(product.id).set(product.toJson());
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
