import 'package:crafty_bay_app/features/shared/presentation/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/providers/top_nav_bar_provider.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key, required this.categoryName});
  static const String name = '/wish_list_screen';
  final String categoryName;

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        context.read<TopNavBarProvider>().backToHomePage();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.categoryName),
          leading: IconButton(
            onPressed: context.read<TopNavBarProvider>().backToHomePage,
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
      ),
    );
  }
}
