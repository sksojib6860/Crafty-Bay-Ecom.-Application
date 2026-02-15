import 'package:flutter/material.dart';

import '../../../../app/app_color.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 4,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColor.themeColor.withAlpha(30),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.computer, size: 36, color: AppColor.themeColor),
        ),
        Text(
          'Electronics',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 9,
            color: AppColor.themeColor,
          ),
        ),
      ],
    );
  }
}
