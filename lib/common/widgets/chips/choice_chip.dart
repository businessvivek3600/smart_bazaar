import 'package:flutter/material.dart';
import 'package:smart_bazar/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:smart_bazar/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.title,
    required this.selected,
    this.onSelected,
  });
  final String title;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(title) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(title,style:TextStyle(color: selected ? TColors.white : null),),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar: isColor
            ? TCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: THelperFunctions.getColor(title)!,
              )
            : null,
        shape: isColor
            ? const CircleBorder()
            : null,
        backgroundColor: isColor
            ? THelperFunctions.getColor(title)!
            : null,
        selectedColor: isColor
            ? THelperFunctions.getColor(title)!
            : null,
        labelPadding: isColor
            ? const EdgeInsets.all(0)
            : null,
        padding:
            isColor ? const EdgeInsets.all(0) : null,
      ),
    );
  }
}
