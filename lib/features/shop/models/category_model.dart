

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String image;
  bool isFeatured;
  String name;
  String parentId;

  CategoryModel({
    required this.image,
    required this.isFeatured,
    required this.name,
    this.parentId =  '', required this.id,
  });
  ///Empty HelperFunction
  static CategoryModel empty() {
    return CategoryModel(
      id: '',
      image: '',
      isFeatured: false,
      name: '',
    );
  }

  // From JSON factory constructor
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
   if (document.data() != null) {
     final data = document.data()!;
      return CategoryModel(
        id: document.id,
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        name: data['Name'] ?? '',
        parentId: data['ParentId'] ?? '',
      );
    } else {
      return CategoryModel.empty();
    }
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'Image': image,
      'IsFeatured': isFeatured,
      'Name': name,
      'ParentId': parentId,
    };
  }
}
