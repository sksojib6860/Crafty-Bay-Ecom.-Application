import 'package:crafty_bay_app/app/extensions/utils_extension.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_color.dart';

class DecrementIncrementButton extends StatefulWidget {
  const DecrementIncrementButton({
    super.key,
    this.width = 100,
    required this.onChange,
  });
  final double width;
  final Function(int) onChange;

  @override
  State<DecrementIncrementButton> createState() =>
      _DecrementIncrementButtonState();
}

class _DecrementIncrementButtonState extends State<DecrementIncrementButton> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton(Icons.add, () {
            widget.onChange(_count);
            _count++;
            setState(() {});
          }),
          Text("$_count", style: context.textTheme.titleLarge),
          _buildButton(Icons.remove, () {
            if (_count > 0) {
              widget.onChange(_count);
              _count--;
            }
            setState(() {});
          }),
        ],
      ),
    );
  }

  Widget _buildButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: AppColor.themeColor,
        ),
        child: Icon(icon, size: 14, color: Colors.white),
      ),
    );
  }
}
