import 'package:flutter/material.dart';
import 'package:smart_bazar/common/widgets/layout/grid_layout.dart';
import 'package:smart_bazar/common/widgets/shimmers/shimmer.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({super.key, this.itemCount = 4});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          children: [
            TShimmerEffect(width: 180, height: 180),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TShimmerEffect(width: 160, height: 15),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            TShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
