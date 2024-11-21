


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smart_bazar/data/services/cloud_storage/firebase_storage_service.dart';

import '../../../features/shop/models/category_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();

  ///Variables
final _db = FirebaseFirestore.instance;

  ///Function to fetch all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final querySnapshot = await _db.collection('Categories').get();
      final list = querySnapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
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

  ///Function to fetch all featured categories
  Future<List<CategoryModel>> fetchFeaturedCategories() async {
    try {
      final querySnapshot = await _db.collection('Categories').where('IsFeatured', isEqualTo: true).get();
      return querySnapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
    } on FirebaseException {
      throw "Something went wrong. Please try again";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  ///Function to fetch all sub categories
  Future<List<CategoryModel>> fetchSubCategories(String parentId) async {
    try {
      final querySnapshot = await _db.collection('Categories').where('ParentId', isEqualTo: parentId).get();
      return querySnapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
    } on FirebaseException {
      throw "Something went wrong. Please try again";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }


  ///Upload Categories to the cloud Firebase
 Future<void>  uploadDummyData(List<CategoryModel> categories) async {
    try {
//upload all categories along with their Images
      final storage = Get.put(TFireBaseStorageService());

      for (var category in categories) {
        //Loop through each category
        final file = await storage.getImageDataFromAssets(category.image);
        //upload image and get its url
        final url = await storage.uploadImageData('Categories',file,category.name);

        // Assign URL to category.image attribute
        category.image = url;


        await _db.collection('Categories').doc(category.id).set(category.toJson());
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