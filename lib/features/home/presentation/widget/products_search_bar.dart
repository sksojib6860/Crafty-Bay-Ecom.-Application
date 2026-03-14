import 'package:crafty_bay_app/app/extensions/language_extension.dart';
import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.l10n;
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.withAlpha(50),
        contentPadding: EdgeInsetsGeometry.zero,
        prefixIcon: Icon(Icons.search_outlined),
        prefixIconColor: Colors.grey,
        hintText: localization.search,
        hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
