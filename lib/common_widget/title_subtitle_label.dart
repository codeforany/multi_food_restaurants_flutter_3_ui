import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class TitleSubTitleLabel extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextAlign textAlign;
  final double fontSizeTitle;
  final double fontSizeSubTitle;
  final CrossAxisAlignment crossAxisAlignment;
  const TitleSubTitleLabel(
      {super.key,
      required this.title,
      required this.subtitle,
      this.textAlign = TextAlign.center,
      this.fontSizeTitle = 24,
      this.fontSizeSubTitle = 12, this.crossAxisAlignment = CrossAxisAlignment.center });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          textAlign: textAlign,
          style: TextStyle(
              color: TColor.text, fontSize: fontSizeTitle, fontWeight: FontWeight.w700),
        ),
        Text(
          subtitle,
          textAlign: textAlign,
          style: TextStyle(
              color: TColor.gray, fontSize: fontSizeSubTitle, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
