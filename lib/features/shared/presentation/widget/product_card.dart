import 'package:crafty_bay_app/features/shared/presentation/widget/rating_widget.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_color.dart';
import '../../../../app/constants.dart';
import '../../../auth/presentations/widget/utils/asset_paths.dart';
import '../../../product/presentations/screen/products_details_screen.dart';
import 'favorite_button_widget.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductsDetailsScreen.name);
        },
        child: Card(
          color: Colors.white,
          shadowColor: AppColor.themeColor.withAlpha(50),
          child: SizedBox(
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 150,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetPaths.shoePng),
                    ),
                    color: AppColor.themeColor.withAlpha(50),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        'Nike Shoes - New edition 2026',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${Constants.takaSign}120',
                            style: TextStyle(color: AppColor.themeColor),
                          ),
                          RatingWidget(rating: '4.6'),
                          FavoriteButton(onTap: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
