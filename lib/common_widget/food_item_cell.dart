import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class FoodItemCell extends StatelessWidget {
  final Map fObj;
  const FoodItemCell({super.key, required this.fObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      width: media.width * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            child: Container(
              color: TColor.secondary,
              width: media.width * 0.4,
              height: media.width * 0.25,
              child: Image.asset(
                fObj["image"].toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),


           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [

                     Text(
                fObj["name"].toString(),
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: TColor.text,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),

              const SizedBox(
                height: 4,
              ),
              Text(
                fObj["address"].toString(),
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: TColor.gray,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 4,),

               Text(
                fObj["category"].toString(),
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: TColor.gray,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
           
                   ]),
           )


        ],
      ),
    );
  }
}
