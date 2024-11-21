


import 'package:smart_bazar/features/shop/models/banner_model.dart';
import 'package:smart_bazar/routes/routes.dart';
import 'package:smart_bazar/utils/constants/image_strings.dart';

import '../../features/shop/models/category_model.dart';

class TDummyData{
  ///-- Banner
  static final List<BannerModel> banners = [
   BannerModel(imageUrl: TImages.banner1, targetScreen: TRoutes.order,active:false),
    BannerModel(imageUrl: TImages.banner2, targetScreen: TRoutes.cart,active :true),
    BannerModel(imageUrl: TImages.banner3, targetScreen: TRoutes.favourites,active :true),
    BannerModel(imageUrl: TImages.banner4, targetScreen: TRoutes.search,active :true),
    BannerModel(imageUrl: TImages.banner5, targetScreen: TRoutes.settings,active :true),
    BannerModel(imageUrl: TImages.banner6, targetScreen: TRoutes.userAddress,active :true),
    BannerModel(imageUrl: TImages.banner8, targetScreen: TRoutes.checkout,active :true),

  ];


  static final List<CategoryModel> categories  = [
    CategoryModel(id: "1", name: 'Electronics', image: TImages.electronicsIcon,isFeatured: true),
    CategoryModel(id: "2", name: 'Clothing', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(id: "3", name: 'Sports ', image: TImages.sportIcon,isFeatured: true),
    CategoryModel(id: "4", name: 'Furniture', image: TImages.furnitureIcon,isFeatured: true),
    CategoryModel(id: "5", name: 'Animals', image: TImages.animalIcon,isFeatured: true),
    CategoryModel(id: "6", name: 'Cosmetics', image: TImages.cosmeticsIcon,isFeatured: true),
    CategoryModel(id: "7", name: 'Shoe', image: TImages.shoeIcon,isFeatured: true),
    CategoryModel(id: "14", name: 'Jewelery', image: TImages.jeweleryIcon,isFeatured: true),

    /// Sub Categories
    CategoryModel(image: TImages.sportIcon, isFeatured: false, name: "Sport shoes", id: "8", parentId: "1"),
    CategoryModel(image: TImages.sportIcon, isFeatured:false, name: "Sports Equipments", id: "9", parentId: "1"),
    CategoryModel(image: TImages.sportIcon, isFeatured: false, name: "Track suits", id: "10", parentId: "1"),
    ///Furnitures
    CategoryModel(image: TImages.furnitureIcon, isFeatured: false, name: "Bedroom furniture", id: "11", parentId: "5"),
    CategoryModel(image: TImages.furnitureIcon, isFeatured: false, name: "Kitchen furniture", id: "12", parentId: "5"),
    CategoryModel(image: TImages.furnitureIcon, isFeatured: false, name: "Office furniture", id: "13", parentId: "5"),

    /// Electronics
    CategoryModel(image: TImages.electronicsIcon, isFeatured: false, name: "Mobiles", id: "15", parentId: "2"),
  CategoryModel(image: TImages.electronicsIcon, isFeatured: false, name: "Laptops", id: "16", parentId: "2"),

    CategoryModel(image: TImages.clothIcon, isFeatured: false, name: "Shirts", id: "17",parentId: "3")
  ];
}