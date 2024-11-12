import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smart_bazar/common/widgets/shimmers/shimmer.dart';
import 'package:smart_bazar/utils/helpers/helper_functions.dart';

import '../../../utils/constants/sizes.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 50,
    this.height = 50,
    this.padding = TSizes.sm,
    required this.image,
    this.fit = BoxFit.contain,
    this.backgroundColor = Colors.transparent,
    this.isNetWorkImage = false,
    this.overlayColor,
  });
  final double width, height, padding;
  final String image;
  final BoxFit? fit;
  final Color? backgroundColor;
  final bool isNetWorkImage;
  final Color? overlayColor;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor ?? (dark ? Colors.black : Colors.white),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetWorkImage
              ? CachedNetworkImage(
                  imageUrl: image,
                  fit: fit,
                  color: overlayColor,
                  progressIndicatorBuilder: (context, url, progress) =>
                      const TShimmerEffect(width: 55, height: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  image: isNetWorkImage
                      ? NetworkImage(image)
                      : AssetImage(image) as ImageProvider,
                  color: overlayColor,
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
