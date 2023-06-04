import 'package:flutter/material.dart';
import 'package:multi_food_restaurants/common/color_extension.dart';

enum RoundButtonType { white, primary }

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final RoundButtonType type;
  const RoundButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.type = RoundButtonType.white});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        minWidth: double.maxFinite,
        color:
            type == RoundButtonType.white ? Colors.white : TColor.primary,
        textColor: type == RoundButtonType.white ? TColor.primary : Colors.white ,
        height: 55,
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
