import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class CollectionFoodItemCell extends StatelessWidget {
  final Map fObj;
  final bool isGrid;
  const CollectionFoodItemCell({super.key, required this.fObj, this.isGrid = false});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      width: isGrid ? double.maxFinite : media.width * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))
        ],
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              color: TColor.secondary,
              width: double.maxFinite,
              height: double.maxFinite,
              child: Image.asset(
                fObj["image"].toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 2,
                    decoration: BoxDecoration(
                      color: TColor.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    fObj["name"].toString(),
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "${fObj["place"].toString()} Place",
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ]),
          )
        ],
      ),
    );
  }
}


