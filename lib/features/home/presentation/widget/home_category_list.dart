import 'package:crafty_bay_app/features/category/presentation/providers/categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/widget/category_card_iteam.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: Consumer<CategoriesProvider>(
        builder: (context, categoryListProvider, _) {
          if (categoryListProvider.getInitialCategoryListInProgress) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: getCategoryListLength(
              categoryListProvider.categories.length,
            ),
            itemBuilder: (context, index) => CategoryCard(
              categoriesModel: categoryListProvider.categories[index],
            ),
            separatorBuilder: (_, __) => const SizedBox(width: 8),
          );
        },
      ),
    );
  }

  int getCategoryListLength(int length) {
    return length > 10 ? 10 : length;
  }
}
