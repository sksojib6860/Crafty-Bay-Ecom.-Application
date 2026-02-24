import 'package:crafty_bay_app/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_color.dart';
import '../../../../app/constants.dart';
import '../../../auth/presentations/widget/utils/asset_paths.dart';
import '../../../shared/presentation/widget/decrement_increment_button.dart';

class CardIteam extends StatefulWidget {
  const CardIteam({super.key});

  @override
  State<CardIteam> createState() => _CardIteamState();
}

class _CardIteamState extends State<CardIteam> {
  @override
  Widget build(BuildContext context) {
    final productStyle = context.textTheme.bodyLarge?.copyWith(
      fontSize: 12,
      color: Colors.grey.shade700,
    );
    return Card(
      elevation: 3,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shadowColor: AppColor.themeColor.withAlpha(30),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetPaths.shoePng, width: 100, height: 100),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New Year Special Shoes',
                            style: context.textTheme.bodyLarge,
                          ),
                          Text('Color : Red  Size : XL', style: productStyle),
                        ],
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${Constants.takaSign} 100',
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: AppColor.themeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: DecrementIncrementButton(onChange: (int count) {}),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
