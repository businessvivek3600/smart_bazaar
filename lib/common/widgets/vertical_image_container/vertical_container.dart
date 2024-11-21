

import 'package:flutter/material.dart';
import 'package:smart_bazar/common/widgets/images/t_circular_image.dart';
import 'package:smart_bazar/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key, required this.image, required this.title, required this.textColor, this.backgroundColor, this.onTap,
 this.isNetworkImage = true });
  final String image , title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function() ? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right:TSizes.spaceBtwItems),
        child: Column(
          children: [
           TCircularImage(image: image,fit: BoxFit.fitWidth,padding: TSizes.sm,
               backgroundColor: backgroundColor, isNetworkImage: isNetworkImage,overlayColor: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(
              width:55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),),

          ],
        ),
      ),
    );
  }
}