import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class NearByListRow extends StatelessWidget {
  final Map fObj;
  final bool isBookmark;
  const NearByListRow({super.key, required this.fObj, this.isBookmark = false});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    var rateVal = double.tryParse( fObj["rate"].toString()) ?? 0.0;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 3, offset: Offset(0, 2))
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              fObj["image"].toString(),
              width: 85,
              height: 85,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
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
                     
                       
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 8),
                      decoration: BoxDecoration(
                        color: rateVal < 4.0 ? TColor.rating : TColor.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        fObj["rate"].toString(),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color:  Colors.white,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      fObj["category"].toString(),
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: TColor.gray,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),

                    if(isBookmark) 
                       Image.asset("assets/img/bookmark_fill.png", width: 15, ),
                      
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
