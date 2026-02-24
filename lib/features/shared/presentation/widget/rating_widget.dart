import 'package:crafty_bay_app/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.rating, this.spacing = 0});
  final String rating;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: spacing,
      children: [
        Icon(Icons.star, size: 24, color: Colors.amber),
        Text(
          rating,
          style: context.textTheme.titleSmall?.copyWith(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
