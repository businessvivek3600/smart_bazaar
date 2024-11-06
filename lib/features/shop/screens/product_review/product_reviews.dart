import 'package:flutter/material.dart';
import 'package:smart_bazar/common/widgets/appbar/appbar.dart';
import 'package:smart_bazar/features/shop/screens/product_review/widgets/user_review_card.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';
import 'widgets/rating_progress_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Reviews & Ratings'),
        showArrowBack: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            TSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  textAlign: TextAlign.justify,
                  " Ratings and Reviews are verified and are from people who use the same type of products that you want to use"),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///overall Product Ratings...
              const TOverallProductRating(),
              const TRatingBarIndicator(
                rating: 4.5,
              ),
              Text(
                "12,345",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///--User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
