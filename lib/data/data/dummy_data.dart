import 'package:smart_bazar/features/shop/models/banner_model.dart';
import 'package:smart_bazar/routes/routes.dart';
import 'package:smart_bazar/utils/constants/image_strings.dart';

import '../../features/shop/models/brand_model.dart';
import '../../features/shop/models/category_model.dart';
import '../../features/shop/models/product_attribute_model.dart';
import '../../features/shop/models/product_model.dart';
import '../../features/shop/models/product_variation_model.dart';

class TDummyData {
  ///-- Banner
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(
        imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(
        imageUrl: TImages.banner3,
        targetScreen: TRoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(
        imageUrl: TImages.banner5,
        targetScreen: TRoutes.settings,
        active: true),
    BannerModel(
        imageUrl: TImages.banner6,
        targetScreen: TRoutes.userAddress,
        active: true),
    BannerModel(
        imageUrl: TImages.banner8,
        targetScreen: TRoutes.checkout,
        active: true),
  ];

  static final List<CategoryModel> categories = [
    CategoryModel(
        id: "1",
        name: 'Electronics',
        image: TImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: "2", name: 'Clothing', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(
        id: "3", name: 'Sports ', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: "4",
        name: 'Furniture',
        image: TImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: "5", name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: "6",
        name: 'Cosmetics',
        image: TImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: "7", name: 'Shoe', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: "14",
        name: 'Jewelery',
        image: TImages.jeweleryIcon,
        isFeatured: true),

    /// Sub Categories
    CategoryModel(
        image: TImages.sportIcon,
        isFeatured: false,
        name: "Sport shoes",
        id: "8",
        parentId: "1"),
    CategoryModel(
        image: TImages.sportIcon,
        isFeatured: false,
        name: "Sports Equipments",
        id: "9",
        parentId: "1"),
    CategoryModel(
        image: TImages.sportIcon,
        isFeatured: false,
        name: "Track suits",
        id: "10",
        parentId: "1"),

    ///Furnitures
    CategoryModel(
        image: TImages.furnitureIcon,
        isFeatured: false,
        name: "Bedroom furniture",
        id: "11",
        parentId: "5"),
    CategoryModel(
        image: TImages.furnitureIcon,
        isFeatured: false,
        name: "Kitchen furniture",
        id: "12",
        parentId: "5"),
    CategoryModel(
        image: TImages.furnitureIcon,
        isFeatured: false,
        name: "Office furniture",
        id: "13",
        parentId: "5"),

    /// Electronics
    CategoryModel(
        image: TImages.electronicsIcon,
        isFeatured: false,
        name: "Mobiles",
        id: "15",
        parentId: "2"),
    CategoryModel(
        image: TImages.electronicsIcon,
        isFeatured: false,
        name: "Laptops",
        id: "16",
        parentId: "2"),

    CategoryModel(
        image: TImages.clothIcon,
        isFeatured: false,
        name: "Shirts",
        id: "17",
        parentId: "3")
  ];

  static final List<ProductModel> products = [
    ProductModel(
      id: '1',
      stock: 20,
      sku: 'PROD-001',
      price: 1540.0,
      title: 'Green Nike Sports Shoe',
      date: DateTime.now(),
      salePrice: 1190.0,
      thumbnail: TImages.productImage23,
      isFeatured: true,
      model: BrandModel(id: '1', name: 'Nike', image: TImages.nikeLogo, isFeatured: true, productCount: 265),
      description: 'The durable rubber outsole ensures superior grip, while the modern design pairs effortlessly with any outfit. Perfect for running, walking, or making a bold fashion statement.',
      categoryId: '1',
      images: [TImages.productImage19, TImages.productImage20, TImages.productImage21, TImages.productImage22],
      productType: 'ProductType.variable',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'White', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU7', 'EU8', 'EU9', 'EU10']),
      ],
      productVariation: [
        ProductVariationModel(
          id: '1',
          sku: 'VAR-001',
          image: TImages.productImage19,
          description: 'Stylish blue variant for sporty comfort.',
          price: 1440.0,
          salePrice: 1290.0,
          stock: 10,
          attributeValues: {'Color': 'Blue', 'Size': 'EU8'},
        ),
        ProductVariationModel(
          id: '2',
          sku: 'VAR-002',
          image: TImages.productImage20,
          description: 'Bold orange option to stand out.',
          price: 1840.0,
          salePrice: 1490.0,
          stock: 10,
          attributeValues: {'Color': 'Orange', 'Size': 'EU8'},
        ),
      ],
    ),
    ProductModel(
      id: '2',
      stock: 10,
      sku: 'PROD-IPHONES',
      price: 1000.0,
      title: 'Apple iPhone 14 Pro',
      date: DateTime.now(),
      salePrice: 950.0,
      thumbnail: TImages.productImage70,
      isFeatured: true,
      model: BrandModel(id: '2', name: 'Apple', image: TImages.appleLogo, isFeatured: true, productCount: 50),
      description: 'Experience cutting-edge performance with the iPhone 14 Pro, featuring advanced cameras and the A16 Bionic chip.',
      categoryId: 'electronics',
      images: [
       TImages.productImage70,
        TImages.productImage71,
        TImages.productImage72,
        TImages.productImage73,
      ],
      productType: 'ProductType.variable',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Space Black', 'Deep Purple', 'Gold']),
        ProductAttributeModel(name: 'Storage', values: ['128GB', '256GB', '512GB']),
      ],
      productVariation: [
        ProductVariationModel(
          id: '1',
          sku: 'VAR-IPHONE-BLACK',
          image:  TImages.productImage71,
          description: 'Space Black iPhone 14 Pro, 256GB',
          price: 1050.0,
          salePrice: 980.0,
          stock: 4,
          attributeValues: {'Color': 'Space Black', 'Storage': '256GB'},
        ),
        ProductVariationModel(
          id: '2',
          sku: 'VAR-IPHONE-PURPLE',
          image: TImages.productImage73,
          description: 'Deep Purple iPhone 14 Pro, 512GB',
          price: 1150.0,
          salePrice: 1050.0,
          stock: 6,
          attributeValues: {'Color': 'Deep Purple', 'Storage': '512GB'},
        ),
      ],
    ),
    ProductModel(
      id: '3',
      stock: 20,
      sku: 'PROD-JACKETS',
      price: 300.0,
      title: 'Premium Leather Jacket',
      date: DateTime.now(),
      salePrice: 280.0,
      thumbnail:  TImages.productImage64,
      isFeatured: true,
      model: BrandModel(id: '3', name: 'FashionWear', image: TImages.adidasLogo, isFeatured: false, productCount: 120),
      description: 'Classic leather jacket crafted for comfort and style, perfect for all seasons.',
      categoryId: 'clothing',
      images: [
        TImages.productImage64,TImages.productImage65,TImages.productImage66,TImages.productImage67,

      ],
      productType: 'ProductType.simple',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Black', 'Brown']),
        ProductAttributeModel(name: 'Size', values: ['M', 'L', 'XL']),
      ],
      productVariation: [
        ProductVariationModel(
          id: '1',
          sku: 'VAR-JACKET-BLACK',
          image: TImages.productImage66,
          description: 'Black leather jacket, size M',
          price: 300.0,
          salePrice: 280.0,
          stock: 10,
          attributeValues: {'Color': 'Black', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '2',
          sku: 'VAR-JACKET-BROWN',
          image: TImages.productImage67,
          description: 'Brown leather jacket, size L',
          price: 320.0,
          salePrice: 290.0,
          stock: 10,
          attributeValues: {'Color': 'Brown', 'Size': 'L'},
        ),
      ],
    ),
    ProductModel(
      id: '4',
      stock: 15,
      sku: 'PROD-BEDS',
      price: 800.0,
      title: 'Luxury Bedroom Bed',
      date: DateTime.now(),
      salePrice: 750.0,
      thumbnail: TImages.productImage43,
      isFeatured: false,
      model: BrandModel(id: '4', name: 'HomeStyle', image: TImages.hermanMillerLogo, isFeatured: false, productCount: 30),
      description: 'Elegant bedroom bed with premium quality wood and comfortable design.',
      categoryId: 'furniture',
      images: [
        TImages.productImage43,
        TImages.productImage44,TImages.productImage45,TImages.productImage46,
      ],
      productType: 'ProductType.simple',
      productAttributes: [
        ProductAttributeModel(name: 'Material', values: ['Oak Wood', 'Pine Wood']),
        ProductAttributeModel(name: 'Size', values: ['Queen', 'King']),
      ],
      productVariation: [
        ProductVariationModel(
          id: '1',
          sku: 'VAR-BED-OAK',
          image:TImages.productImage44,
          description: 'Queen size bed made of oak wood',
          price: 850.0,
          salePrice: 780.0,
          stock: 5,
          attributeValues: {'Material': 'Oak Wood', 'Size': 'Queen'},
        ),
        ProductVariationModel(
          id: '2',
          sku: 'VAR-BED-PINE',
          image: TImages.productImage45,
          description: 'King size bed made of pine wood',
          price: 900.0,
          salePrice: 820.0,
          stock: 10,
          attributeValues: {'Material': 'Pine Wood', 'Size': 'King'},
        ),
      ],
    ),
    ProductModel(
      id: '5',
      stock: 25,
      sku: 'PROD-LAPTOPS',
      price: 1200.0,
      title: 'High-Performance Laptop',
      date: DateTime.now(),
      salePrice: 1100.0,
      thumbnail: TImages.productImage47,
      isFeatured: true,
      model: BrandModel(id: '5', name: 'TechPro', image: TImages.acerlogo, isFeatured: true, productCount: 75),
      description: 'Powerful laptop with advanced features for professional and personal use.',
      categoryId: 'electronics',
      images: [
        TImages.productImage47,
        TImages.productImage48,
        TImages.productImage49,
        TImages.productImage50,
      ],
      productType: 'ProductType.variable',
      productAttributes: [
        ProductAttributeModel(name: 'Processor', values: ['Intel i5', 'Intel i7']),
        ProductAttributeModel(name: 'RAM', values: ['8GB', '16GB']),
      ],
      productVariation: [
        ProductVariationModel(
          id: '1',
          sku: 'VAR-LAPTOP-I5',
          image:TImages.productImage48,
          description: 'Intel i5 with 8GB RAM',
          price: 1150.0,
          salePrice: 1050.0,
          stock: 12,
          attributeValues: {'Processor': 'Intel i5', 'RAM': '8GB'},
        ),
        ProductVariationModel(
          id: '2',
          sku: 'VAR-LAPTOP-I7',
          image: TImages.productImage49,
          description: 'Intel i7 with 16GB RAM',
          price: 1350.0,
          salePrice: 1250.0,
          stock: 13,
          attributeValues: {'Processor': 'Intel i7', 'RAM': '16GB'},
        ),
      ],
    ),
  ];
}
