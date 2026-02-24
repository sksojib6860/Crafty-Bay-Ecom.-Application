import 'package:crafty_bay_app/app/app_color.dart';
import 'package:crafty_bay_app/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onChange});

  final List<String> colors;
  final Function(String) onChange;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text('Color', style: context.textTheme.bodyLarge),
        Row(
          children: widget.colors.map((color) {
            return GestureDetector(
              onTap: () {
                selectedColor = color;
                setState(() {});
                widget.onChange(color);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.themeColor),
                  color: color == selectedColor
                      ? AppColor.themeColor
                      : Colors.white,
                ),
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  color,
                  style: TextStyle(
                    color: color == selectedColor ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
