import 'package:crafty_bay_app/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_color.dart';

class ReviewBottomBar extends StatelessWidget {
  const ReviewBottomBar({super.key, required this.toTapCart});

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
              Text('Reviews (100)', style: context.textTheme.bodyLarge),
            ],
          ),
        ],
      ),
    );
  }
}
