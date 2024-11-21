import 'package:get/get.dart';
import 'package:smart_bazar/features/authentication/screens/login/login_screen.dart';
import 'package:smart_bazar/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:smart_bazar/features/personalization/screens/settings/setting_screen.dart';
import 'package:smart_bazar/features/shop/screens/home/home.dart';
import 'package:smart_bazar/routes/routes.dart';

import '../features/authentication/screens/onboarding_screens/on_boarding.dart';
import '../features/authentication/screens/sign_up/signup_screen.dart';
import '../features/authentication/screens/sign_up/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/shop/screens/cart/cart_screen.dart';
import '../features/shop/screens/checkout/checkout_screen.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/product_review/product_reviews.dart';
import '../features/shop/screens/store/store_screen.dart';
import '../features/shop/screens/wishList/favourite_screen.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReviewsScreen()),
   // GetPage(name: TRoutes.productDetails, page: () => const ProductDetailsScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
  //  GetPage(name: TRoutes.brand, page: () => const BrandScreen()),
   // GetPage(name: TRoutes.allProducts, page: () => const AllProductsScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
  //  GetPage(name: TRoutes.signupSuccess, page: () => const SignupSuccessScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgotPassword, page: () => const ForgetPassword()),
   // GetPage(name: TRoutes.resetPassword, page: () => const ResetPasswordScreen()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
    // GetPage(name: TRoutes.product, page: () => const ProductScreen()),
  ];
}
