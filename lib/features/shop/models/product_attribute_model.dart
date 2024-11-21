class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({
    this.name,
    this.values,
  });

  // From Map constructor
  factory ProductAttributeModel.fromJson(Map<String, dynamic> data) {
    final map = data;
    if (data.isEmpty) return ProductAttributeModel();
    return ProductAttributeModel(
      name: map['name'],
      values: List<String>.from(map['values']),
    );
  }

  // To Json method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'values': values,
    };
  }
}
