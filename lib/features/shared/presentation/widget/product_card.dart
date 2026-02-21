import 'package:crafty_bay_app/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_color.dart';
import '../../../../app/constants.dart';
import '../../../auth/presentations/widget/utils/asset_paths.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {},
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
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(Icons.star, size: 24, color: Colors.amber),
                              Text(
                                '4.5',
                                style: context.textTheme.titleSmall?.copyWith(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: AppColor.themeColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
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
