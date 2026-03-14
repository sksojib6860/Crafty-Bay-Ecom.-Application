import 'package:crafty_bay_app/app/extensions/language_extension.dart';
import 'package:crafty_bay_app/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.onTapSeeAll,
  });
  final String title;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    final localization = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: context.textTheme.titleLarge),
          TextButton(onPressed: onTapSeeAll, child: Text(localization.seeAll)),
        ],
      ),
    );
  }
}
