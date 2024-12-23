import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_bazar/common/widgets/shimmers/shimmer.dart';
import 'package:smart_bazar/features/personalization/controllers/user_controller.dart';
import 'package:smart_bazar/utils/constants/colors.dart';
import 'package:smart_bazar/utils/constants/text_strings.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.grey)),
          Obx(() {
            if (controller.userProfileLoading.value) {
              return const TShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.white));
            }
          }),
        ],
      ),
      actions: [
        TCartCounterIcon(
          onPressed: () {},
          iconColor: TColors.white,
        ),
      ],
    );
  }
}
