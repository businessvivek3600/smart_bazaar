import 'package:flutter/material.dart';
import 'package:smart_bazar/common/widgets/appbar/appbar.dart';
import 'package:smart_bazar/features/shop/screens/order/widgets/order_list.dart';
import 'package:smart_bazar/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("My Orders",style: Theme.of(context).textTheme.headlineSmall,),
        showArrowBack: true,
      ),
      body: const Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
      child: TOrderListItems(),
      ),
    );
  }
}
