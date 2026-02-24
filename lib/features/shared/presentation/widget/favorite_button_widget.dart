import 'package:flutter/material.dart';

import '../../../../app/app_color.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.onTap, this.iconSize = 16});

  final VoidCallback onTap;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: AppColor.themeColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(Icons.favorite_border, color: Colors.white, size: iconSize),
      ),
    );
  }
}
