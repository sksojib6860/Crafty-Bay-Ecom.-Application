import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../product/presentations/widget/price_and_cart_section.dart';
import '../../../shared/presentation/providers/top_nav_bar_provider.dart';
import '../widget/card_iteam.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.categoryName});
  static const String name = '/cart_screen';
  final String categoryName;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, __) {
                  return CardIteam();
                },
              ),
            ),
            PriceAndCartSection(price: 1500.96, toTapCart: () {}),
          ],
        ),
      ),
    );
  }
}
