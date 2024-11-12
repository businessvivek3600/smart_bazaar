


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
    } on FirebaseException catch (e) {
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
    } on FirebaseException catch (e) {
      throw "Something went wrong. Please try again";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

}