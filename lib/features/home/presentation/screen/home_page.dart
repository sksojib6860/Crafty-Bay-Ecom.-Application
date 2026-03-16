import 'package:crafty_bay_app/app/controllers/auth_controller.dart';
import 'package:crafty_bay_app/app/extensions/language_extension.dart';
import 'package:crafty_bay_app/features/auth/presentations/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../auth/presentations/widget/utils/asset_paths.dart';
import '../widget/app_bar_icon_button.dart';
import '../widget/home_category_list.dart';
import '../widget/home_slider.dart';
import '../widget/horizontal_products_list.dart';
import '../widget/products_search_bar.dart';
import '../widget/section_headers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final localization = context.l10n;
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              ProductSearchBar(),
              const SizedBox(height: 16),
              HomeSlider(),
              SectionHeader(
                title: localization.allCatogories,
                onTapSeeAll: () {},
              ),
              HomeCategoryList(),
              SectionHeader(title: localization.popular, onTapSeeAll: () {}),
              HorizontalProductList(),
              SectionHeader(title: localization.special, onTapSeeAll: () {}),
              HorizontalProductList(),
              SectionHeader(title: localization.nEw, onTapSeeAll: () {}),
              HorizontalProductList(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: SvgPicture.asset(AssetPaths.navLogo),
      actions: [
        AppbarIconButton(icon: Icons.person, onTap: () {}),
        const SizedBox(width: 4),
        AppbarIconButton(icon: Icons.call, onTap: () {}),
        const SizedBox(width: 4),
        AppbarIconButton(
          icon: Icons.notifications_active_rounded,
          onTap: () {},
        ),
        AppbarIconButton(
          icon: Icons.logout_rounded,
          onTap: () {
            AuthController.clearUserData();
            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginScreen.name,
              (route) => false,
            );
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
