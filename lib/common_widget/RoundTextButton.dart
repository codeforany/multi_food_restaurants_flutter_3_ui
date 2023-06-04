import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class RoundTextButton extends StatelessWidget {
  final String title;
  final bool isSelect;
  final VoidCallback onPressed;
  const RoundTextButton(
      {super.key,
      required this.title,
      required this.isSelect,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        decoration: BoxDecoration(
            color: isSelect ? TColor.primary : Colors.white,
            border: Border.all(
              color: TColor.primary,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: isSelect ? Colors.white : TColor.primary,
              fontSize: 12,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
