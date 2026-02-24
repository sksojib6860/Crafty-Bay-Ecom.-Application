import 'package:crafty_bay_app/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_color.dart';
import '../../../../app/constants.dart';

class PriceAndCartSection extends StatelessWidget {
  const PriceAndCartSection({
    super.key,
    required this.price,
    required this.toTapCart,
  });

  final double price;
  final VoidCallback toTapCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 80,
      decoration: BoxDecoration(
        color: AppColor.themeColor.withAlpha(20),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price', style: context.textTheme.bodyLarge),
              Text(
                '${Constants.takaSign} $price',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColor.themeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          FilledButton(
            style: FilledButton.styleFrom(fixedSize: Size.fromWidth(130)),
            onPressed: toTapCart,
            child: Text('Add to cart'),
          ),
        ],
      ),
    );
  }
}
