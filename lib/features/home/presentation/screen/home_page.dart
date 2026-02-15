import 'package:crafty_bay_app/features/auth/presentations/widget/utils/asset_paths.dart';
import 'package:crafty_bay_app/features/home/presentation/widget/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/app_bar_icon_button.dart';
import '../widget/products_search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            ProductSearchBar(),
            const SizedBox(height: 16),
            HomeSlider(),
          ],
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
        const SizedBox(width: 8),
      ],
    );
  }
}
