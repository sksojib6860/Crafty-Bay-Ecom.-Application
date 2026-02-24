import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_color.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({super.key});

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  final ValueNotifier _currentIndex = ValueNotifier<int>(0);
  final List _list = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
            height: 230,
            viewportFraction: 1,
          ),
          items: _list.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.grey.withAlpha(50)),
                  alignment: Alignment.center,
                  child: Text('text $i'),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 9,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      margin: EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                        color: value == i ? AppColor.themeColor : Colors.white,
                        shape: BoxShape.circle,
                      ),
                      height: 12,
                      width: 12,
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
