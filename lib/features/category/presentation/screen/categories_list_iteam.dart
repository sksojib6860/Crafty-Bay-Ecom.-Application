import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/providers/top_nav_bar_provider.dart';
import '../../../shared/presentation/widget/category_card_iteam.dart';

class CategoriesListIteam extends StatefulWidget {
  const CategoriesListIteam({super.key});

  @override
  State<CategoriesListIteam> createState() => _CategoriesListIteamState();
}

class _CategoriesListIteamState extends State<CategoriesListIteam> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, result) {
        _backToHomePage();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
          leading: IconButton(
            onPressed: context.read<TopNavBarProvider>().backToHomePage,
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              return FittedBox(child: CategoryCard());
            },
          ),
        ),
      ),
    );
  }

  void _backToHomePage() {
    context.read<TopNavBarProvider>().backToHomePage();
  }
}
