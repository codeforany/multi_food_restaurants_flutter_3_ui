import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class OutletListRow extends StatelessWidget {
  final Map fObj;
  const OutletListRow({super.key, required this.fObj});

  @override
  Widget build(BuildContext context) {
    var rateVal = double.tryParse(fObj["rate"].toString()) ?? 0.0;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 3, offset: Offset(0, 2))
          ]),
      child: Row(
        
        children: [


          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      fObj["time"].toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: TColor.gray,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      decoration: BoxDecoration(
                        color: rateVal < 4.0 ? TColor.rating : TColor.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        fObj["rate"].toString(),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
                Text(
                  fObj["name"].toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  fObj["address"].toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: TColor.gray,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  fObj["category"].toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: TColor.gray,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
