import 'package:crafty_bay_app/features/shared/presentation/widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryName});
  static const String name = '/category_details_screen';
  final String categoryName;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        leading: IconButton(
          onPressed: () {
            //TODO: solve back to previous screen;
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (_, __) => FittedBox(child: ProductCard()),
        ),
      ),
    );
  }
}
