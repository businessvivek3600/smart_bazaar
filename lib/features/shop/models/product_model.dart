import 'package:cloud_firestore/cloud_firestore.dart';
import 'brand_model.dart';
import 'product_attribute_model.dart';
import 'product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? model;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariation;

  ProductModel({
    required this.id,
    required this.stock,
    this.sku,
    required this.price,
    required this.title,
    this.date,
    required this.salePrice,
    required this.thumbnail,
    this.isFeatured,
    this.model,
    this.description,
    this.categoryId,
    this.images,
    required this.productType,
    this.productAttributes,
    this.productVariation,
  });

  // Empty Helper Function
  static ProductModel empty() {
    return ProductModel(
      id: '',
      stock: 0,
      price: 0.0,
      title: '',
      salePrice: 0.0,
      thumbnail: '',
      productType: '',
    );
  }

  // From JSON factory constructor
  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return ProductModel(
        id: document.id,
        stock: data['Stock'] ?? 0,
        sku: data['Sku'],
        price: data['Price']?.toDouble() ?? 0.0,
        title: data['Title'] ?? '',
        date: (data['Date'] != null) ? (data['Date'] as Timestamp).toDate() : null,
        salePrice: data['SalePrice']?.toDouble() ?? 0.0,
        thumbnail: data['Thumbnail'] ?? '',
        isFeatured: data['IsFeatured'],
        model: data['BrandModel'] != null ? BrandModel.fromMap(data['BrandModel']) : null,
        description: data['Description'],
        categoryId: data['CategoryId'],
        images: List<String>.from(data['Images'] ?? []),
        productType: data['ProductType'] ?? '',
        productAttributes: data['ProductAttributes'] != null
            ? List<ProductAttributeModel>.from(data['ProductAttributes'].map((e) => ProductAttributeModel.fromJson(e)))
            : null,
        productVariation: data['ProductVariation'] != null
            ? List<ProductVariationModel>.from(data['ProductVariation'].map((e) => ProductVariationModel.fromJson(e)))
            : null,
      );
    } else {
      return ProductModel.empty();
    }
  }

  // From QuerySnapshot method
  static ProductModel fromQuerySnapshot(QueryDocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return ProductModel(
      id: document.id,
      stock: data['Stock'] ?? 0,
      sku: data['Sku'],
      price: data['Price']?.toDouble() ?? 0.0,
      title: data['Title'] ?? '',
      date: (data['Date'] != null) ? (data['Date'] as Timestamp).toDate() : null,
      salePrice: data['SalePrice']?.toDouble() ?? 0.0,
      thumbnail: data['Thumbnail'] ?? '',
      isFeatured: data['IsFeatured'],
      model: data['BrandModel'] != null ? BrandModel.fromMap(data['BrandModel']) : null,
      description: data['Description'],
      categoryId: data['CategoryId'],
      images: List<String>.from(data['Images'] ?? []),
      productType: data['ProductType'] ?? '',
      productAttributes: data['ProductAttributes'] != null
          ? List<ProductAttributeModel>.from(data['ProductAttributes'].map((e) => ProductAttributeModel.fromJson(e)))
          : null,
      productVariation: data['ProductVariation'] != null
          ? List<ProductVariationModel>.from(data['ProductVariation'].map((e) => ProductVariationModel.fromJson(e)))
          : null,
    );
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    return {
      'Stock': stock,
      'Sku': sku,
      'Price': price,
      'Title': title,
      'Date': date != null ? Timestamp.fromDate(date!) : null,
      'SalePrice': salePrice,
      'Thumbnail': thumbnail,
      'IsFeatured': isFeatured,
      'BrandModel': model?.toMap(),
      'Description': description,
      'CategoryId': categoryId,
      'Images': images,
      'ProductType': productType,
      'ProductAttributes': productAttributes?.map((e) => e.toJson()).toList(),
      'ProductVariation': productVariation?.map((e) => e.toJson()).toList(),
    };
  }
}
