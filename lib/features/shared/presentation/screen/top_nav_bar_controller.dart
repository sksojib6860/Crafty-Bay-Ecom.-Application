import 'package:crafty_bay_app/features/home/presentation/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/top_nav_bar_provider.dart';

class TopNavBarController extends StatefulWidget {
  const TopNavBarController({super.key});

  static const String name = '/top_nav_bar_controller';

  @override
  State<TopNavBarController> createState() => _TopNavBarControllerState();
}

class _TopNavBarControllerState extends State<TopNavBarController> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    Center(child: Text('Categories')),
    Center(child: Text('Cart')),
    Center(child: Text('Wish')),
  ];

  //TODO: use provider , just create provider ,
  @override
  Widget build(BuildContext context) {
    return Consumer<TopNavBarProvider>(
      builder: (context, topNavBarProvider, _) {
        return Scaffold(
          body: _pages[topNavBarProvider.selectedIndex],
          bottomNavigationBar: NavigationBar(
            indicatorShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                icon: Icon(Icons.dashboard),
                label: 'Categories',
              ),
              NavigationDestination(
                icon: Icon(Icons.add_shopping_cart_outlined),
                label: 'Cart',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_outline),
                label: 'Wish',
              ),
            ],
          ),
        );
      },
    );
  }
}
