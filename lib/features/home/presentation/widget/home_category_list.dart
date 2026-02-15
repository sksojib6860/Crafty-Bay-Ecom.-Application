import 'package:flutter/material.dart';

import '../../../shared/presentation/widget/category_card_iteam.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => CategoryCard(),
        separatorBuilder: (_, __) => const SizedBox(width: 8),
      ),
    );
  }
}
