
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class ImgTextButton extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final VoidCallback onPressed;
  const ImgTextButton({super.key, required this.title, required this.subTitle, required this.image, required this.onPressed });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return TextButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              image,
              width: media.width * 0.19,
              height: media.width * 0.19,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: TextStyle(
                color: TColor.text, fontSize: 12, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            subTitle,
            style: TextStyle(
                color: TColor.gray, fontSize: 12, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}