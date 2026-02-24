import 'package:crafty_bay_app/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_color.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.onChange});

  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? selectedSizes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text('Size', style: context.textTheme.bodyLarge),
        Row(
          children: widget.sizes.map((sizes) {
            return GestureDetector(
              onTap: () {
                selectedSizes = sizes;
                widget.onChange(sizes);
                setState(() {});
              },
              child: Container(
                margin: EdgeInsets.only(right: 8),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.themeColor),
                  borderRadius: BorderRadius.circular(100),
                  color: sizes == selectedSizes
                      ? AppColor.themeColor
                      : Colors.white,
                ),
                child: Text(
                  sizes,
                  style: TextStyle(
                    color: sizes == selectedSizes ? Colors.white : Colors.black,
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
