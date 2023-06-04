import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class SelectionButton extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onPressed;
  final bool isSelect;
  const SelectionButton(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.isSelect,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: FittedBox(child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: isSelect ? TColor.primary : TColor.text,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
          Text(
            subTitle,
            style: TextStyle(
                color: isSelect ? TColor.primary : TColor.gray,
                fontSize: 12,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
      ),
    );
  }
}
