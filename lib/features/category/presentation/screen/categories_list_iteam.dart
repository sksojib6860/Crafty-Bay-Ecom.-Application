import 'package:crafty_bay_app/app/extensions/language_extension.dart';
import 'package:crafty_bay_app/features/category/presentation/providers/categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentation/providers/top_nav_bar_provider.dart';
import '../../../shared/presentation/widget/category_card_iteam.dart';

class CategoriesListItem extends StatefulWidget {
  const CategoriesListItem({super.key});

  @override
  State<CategoriesListItem> createState() => _CategoriesListItemState();
}

class _CategoriesListItemState extends State<CategoriesListItem> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadCategory);
  }

  void _loadCategory() {
    if (context.read<CategoriesProvider>().loadMoreCategoriesListInProgress) {
      return;
    }
    if (_scrollController.position.extentBefore < 300) {
      context.read<CategoriesProvider>().getCategories();
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = context.l10n;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, result) {
        _backToHomePage();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(localization.categories),
          leading: IconButton(
            onPressed: context.read<TopNavBarProvider>().backToHomePage,
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        body: Consumer<CategoriesProvider>(
          builder: (context, categoryListProvider, _) {
            if (categoryListProvider.getInitialCategoryListInProgress) {
              return Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      controller: _scrollController,
                      itemCount: categoryListProvider.categories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) {
                        return FittedBox(
                          child: CategoryCard(
                            categoriesModel:
                                categoryListProvider.categories[index],
                          ),
                        );
                      },
                    ),
                  ),
                  if (categoryListProvider.loadMoreCategoriesListInProgress)
                    Center(child: CircularProgressIndicator()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _backToHomePage() {
    context.read<TopNavBarProvider>().backToHomePage();
  }
}
