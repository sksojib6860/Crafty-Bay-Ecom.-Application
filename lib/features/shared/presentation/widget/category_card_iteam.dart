import 'package:crafty_bay_app/features/category/presentation/model/categories_model.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_color.dart';
import '../../../product/presentations/screen/product_list_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoriesModel});

  final CategoriesModel categoriesModel;

  @override
  Widget build(BuildContext context) {
    //final localization = context.l10n;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductListScreen.name,
          arguments: categoriesModel.title,
        );
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
            child: Image.network(
              categoriesModel.icon,
              width: 30,
              height: 30,
              errorBuilder: (context, error, loadingError) {
                return Icon(Icons.error_outline);
              },
            ),
          ),
          Text(
            //  localization.title
            categoriesModel.title,
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
}
