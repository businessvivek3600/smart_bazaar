

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class TSearchBar extends StatelessWidget {
  const TSearchBar({
    super.key,
    this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true, required this.padding,
  });
  final String? text;
  final IconData? icon;
  final EdgeInsetsGeometry padding;
  final bool showBackground, showBorder;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: TextFormField(
        style: Theme.of(context).textTheme.bodySmall!.apply(color:  dark ? TColors.textWhite :  TColors.dark),
        decoration: InputDecoration(
          filled: true,
          fillColor: showBackground
              ? dark
              ? TColors.dark
              : TColors.light
              : Colors.transparent,
          prefixIcon:  Icon(
            icon,
            color: dark ? TColors.darkerGrey : TColors.dark,
          ),
          contentPadding: const EdgeInsets.all(TSizes.md),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              borderSide: showBorder ? const BorderSide(color: TColors.grey) : BorderSide.none),
          hintText: text,
          hintStyle: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}