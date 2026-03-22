import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_app/app/app_color.dart';
import 'package:crafty_bay_app/features/home/presentation/provider/slider_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final ValueNotifier _currentIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Consumer<SliderProviders>(
      builder: (context, homeSliderProvider, _) {
        if (homeSliderProvider.isSliderInProgress) {
          return SizedBox(
            height: 190,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  _currentIndex.value = index;
                },
                height: 180,
                autoPlay: false,
                viewportFraction: 1,
              ),
              items: homeSliderProvider.sliderModels.map((sliders) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: AppColor.themeColor.withAlpha(30),
                      ),
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(9),
                        child: Image.network(
                          sliders.photoUrl,
                          fit: BoxFit.cover,
                          height: double.maxFinite,
                          width: double.maxFinite,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, error, loadingProgress) {
                            return Icon(Icons.error_outline);
                          },
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 15),
            ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (
                      int i = 0;
                      i < homeSliderProvider.sliderModels.length;
                      i++
                    )
                      Container(
                        margin: EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                          color: value == i
                              ? AppColor.themeColor
                              : Colors.white,
                          border: Border.all(color: AppColor.themeColor),
                          shape: BoxShape.circle,
                        ),
                        height: 10,
                        width: 10,
                      ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
