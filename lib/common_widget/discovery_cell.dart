
import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class DiscoveryCell extends StatelessWidget {
  final Map fObj;
  const DiscoveryCell({super.key, required this.fObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            fObj["image"].toString(),
            width: media.width * 0.15,
            height: media.width * 0.15,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: media.width * 0.04,
          ),
          Text(
            fObj["name"].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: TColor.text, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          Text(
            "${ fObj["place"].toString() } Place",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: TColor.gray, fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}