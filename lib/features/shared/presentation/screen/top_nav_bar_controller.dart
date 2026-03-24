import 'package:crafty_bay_app/app/extensions/language_extension.dart';
import 'package:crafty_bay_app/features/category/presentation/providers/categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../cart/presentations/screen/cart_screen.dart';
import '../../../category/presentation/screen/categories_list_iteam.dart';
import '../../../home/presentation/provider/slider_providers.dart';
import '../../../home/presentation/screen/home_page.dart';
import '../../../wishlist/presentations/screen/wish_list_screen.dart';
import '../providers/top_nav_bar_provider.dart';

class TopNavBarController extends StatefulWidget {
  const TopNavBarController({super.key});

  static const String name = '/top_nav_bar_controller';

  @override
  State<TopNavBarController> createState() => _TopNavBarControllerState();
}

class _TopNavBarControllerState extends State<TopNavBarController> {
  final List<Widget> _pages = [
    HomePage(),
    CategoriesListItem(),
    CartScreen(categoryName: 'Cart'),
    WishListScreen(categoryName: 'Wish List'),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SliderProviders>().getHomeSliders();
      context.read<CategoriesProvider>().getCategories();
    });
  }

  //TODO: use provider , just create provider ,
  @override
  Widget build(BuildContext context) {
    final localization = context.l10n;

    return Consumer<TopNavBarProvider>(
      builder: (context, topNavBarProvider, _) {
        return Scaffold(
          body: _pages[topNavBarProvider.selectedIndex],
          bottomNavigationBar: NavigationBar(
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            selectedIndex: topNavBarProvider.selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                topNavBarProvider.setSelectedIndex(index);
              });
            },
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: localization.home,
              ),
              NavigationDestination(
                icon: Icon(Icons.dashboard),
                label: localization.categories,
              ),
              NavigationDestination(
                icon: Icon(Icons.add_shopping_cart_outlined),
                label: localization.cart,
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_outline),
                label: localization.wishList,
              ),
            ],
          ),
        );
      },
    );
  }
}
