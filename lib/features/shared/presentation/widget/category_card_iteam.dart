import 'package:crafty_bay_app/app/extensions/language_extension.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_color.dart';
import '../../../product/presentations/screen/product_list_screen.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({super.key});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    final localization = context.l10n;
    return GestureDetector(
      onTap: () {
        _productListScreen();
      },
      child: Column(
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
            localization.electronics,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 9,
              color: AppColor.themeColor,
            ),
          ),
        ],
      ),
    );
  }

  void _productListScreen() {
    Navigator.pushNamed(
      context,
      ProductListScreen.name,
      arguments: 'Electronics',
    );
  }
}
