import 'package:flutter/material.dart';

import '../../../shared/presentation/widget/product_card.dart';

class HorizontalProductList extends StatelessWidget {
  const HorizontalProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return ProductCard();
        },
      ),
    );
  }
}
