import 'package:crafty_bay_app/app/extensions/language_extension.dart';
import 'package:crafty_bay_app/app/extensions/utils_extension.dart';
import 'package:crafty_bay_app/features/product/presentations/screen/reviews_screen.dart';
import 'package:flutter/material.dart';

import '../../../shared/presentation/widget/decrement_increment_button.dart';
import '../../../shared/presentation/widget/favorite_button_widget.dart';
import '../../../shared/presentation/widget/rating_widget.dart';
import '../widget/color_picker.dart';
import '../widget/description.dart';
import '../widget/price_and_cart_section.dart';
import '../widget/products_image_carousel.dart';
import '../widget/size_picker.dart';

class ProductsDetailsScreen extends StatefulWidget {
  const ProductsDetailsScreen({super.key});
  static const String name = '/products_details_screen';

  @override
  State<ProductsDetailsScreen> createState() => _ProductsDetailsScreenState();
}

class _ProductsDetailsScreenState extends State<ProductsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final localization = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(localization.productsDetails)),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageCarousel(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: [
                        _buildTitleSection(),
                        ColorPicker(
                          onChange: (String color) {},
                          colors: ['Black', 'White', 'Red', 'Green', 'Blue'],
                        ),
                        SizedBox(height: 10),
                        SizePicker(
                          sizes: ['M', 'L', 'XL', 'XXL', '2XL'],
                          onChange: (String sizes) {},
                        ),
                        SizedBox(height: 10),
                        Description(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          PriceAndCartSection(price: 100, toTapCart: () {}),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildTitleSection() {
    return Row(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                'Nike 2026 - New Year Special Edition',
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.black54,
                ),
              ),
              Row(
                children: [
                  RatingWidget(rating: '4.0', spacing: 5),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ReviewsScreen.name);
                    },
                    child: Text('Review'),
                  ),
                  FavoriteButton(onTap: () {}, iconSize: 20),
                ],
              ),
            ],
          ),
        ),
        DecrementIncrementButton(onChange: (int count) {}),
      ],
    );
  }
}
