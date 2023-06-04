import 'package:flutter/material.dart';

class TColor {
  static Color get primary => const Color(0xff20D994);
  static Color get primaryText => const Color(0xffffffff);

  static Color get secondary => const Color(0xff173143);
  static Color get text => secondary;

  static Color get rating => const Color(0xffCDD614);

  static Color get color1 => const Color(0xffE8334A);
  static Color get color2 => const Color(0xff60B8F6);

  static Color get gray => const Color(0xff9D9D9D);
  static Color get bg => const Color(0xffF2F2F3);

  static List<Color> get list => [
        const Color(0xffE8334A),
        const Color(0xffF5821F),
        const Color(0xff63BF67)
      ];
  static List<Color> get favList => [
        const Color(0xff4F2E19),
        const Color(0xff794C2F),
        const Color(0xff933017),
         const Color(0xff435124),
        const Color(0xff523B13),
        const Color(0xff322216)
      ];
}
