class ProductVariationModel {
  String? id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
     required this.id,
     this.sku = '',
 this.image = '',
    this.description,
     this.price = 0.0,
     this.salePrice = 0.0,
   this.stock = 0,
    required this.attributeValues,
  });
///Empty HelperFunction for clean code
  static ProductVariationModel empty() {
    return ProductVariationModel(
      id: '',
      attributeValues: {},
    );
  }
  // From Map constructor
  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final map = document;
    if (map.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: map['id'],
      sku: map['sku'],
      image: map['image'],
      description: map['description'],
      price: map['price'].toDouble(),
      salePrice: map['salePrice'].toDouble(),
      stock: map['stock'],
      attributeValues: Map<String, String>.from(map['attributeValues'] ?? {}),
    );
  }

  // To Map method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sku': sku,
      'image': image,
      'description': description,
      'price': price,
      'salePrice': salePrice,
      'stock': stock,
      'attributeValues': attributeValues,
    };
  }
}
