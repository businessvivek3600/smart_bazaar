import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:smart_bazar/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:smart_bazar/common/widgets/products/ratings/rating_indicator.dart';
import 'package:smart_bazar/utils/constants/colors.dart';
import 'package:smart_bazar/utils/constants/image_strings.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';
import 'package:smart_bazar/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage1),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  "John Doe",
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(
          height: TSizes.sm,
        ),

        ///Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              "01 Jan, 2024",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.md,
        ),
        const ReadMoreText(
          'Absolutely fantastic! The product exceeded my expectations in every way. Great quality and fast delivery. Highly recommend!',
          trimLines: 2,
          textAlign: TextAlign.justify,
          trimMode: TrimMode.Line,
          trimCollapsedText: " show more",
          trimExpandedText: ' show less',
          moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
        lessStyle:  TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
        ),
        ///Company Review
        const SizedBox(height: TSizes.spaceBtwItems,),
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey ,
          child: Padding(padding: const EdgeInsets.all(TSizes.md),child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Nike Store",style: Theme.of(context).textTheme.titleMedium,),
                  Text("02 Jan, 2024",style: Theme.of(context).textTheme.bodyMedium)
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const ReadMoreText(
                "Thank you so much for your wonderful review! We're thrilled to hear that our product exceeded your expectations and that you were pleased with the quality and delivery. Your recommendation means a lot to us, and we look forward to serving you again in the future!",
                trimLines: 2,
                textAlign: TextAlign.justify,
                trimMode: TrimMode.Line,
                trimCollapsedText: " show more",
                trimExpandedText: ' show less',
                moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
                lessStyle:  TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
              ),
            ],
          ),),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
      ],
    );
  }
}
