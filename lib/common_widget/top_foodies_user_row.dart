import 'package:flutter/material.dart';

import '../common/color_extension.dart';
import 'RoundTextButton.dart';

class TopFoodiesUserRow extends StatelessWidget {
  final Map uObj;
  final bool showRank;
  const TopFoodiesUserRow({super.key, required this.uObj, this.showRank = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              color: TColor.secondary,
              child: Image.asset(
                uObj["images"].toString(),
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  uObj["name"].toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "${uObj["reviews"].toString()} Reviews, ${uObj["photos"].toString()} Photos ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: TColor.gray,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  uObj["type"].toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: getTypeColor(uObj["type"].toString()),
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              RoundTextButton(title: "Follow", isSelect: uObj["is_follow"].toString() == "1" , onPressed: (){

              },  ),
              
              if (showRank)
              const SizedBox(
                height: 4,
              ),

              if(showRank)
              Text(
                "#${ uObj["rank"].toString() }",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: getTypeColor(uObj["type"].toString()),
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
            ],
          )
        ],
      ),
    );
  }

  Color getTypeColor(String type) {
    switch (type) {
      case "Diamond Foodie":
        return TColor.primary;
      case "Gold Foodie":
        return const Color(0xffCDD614);
      case "Silver Foodie":
        return const Color(0xff60B8F6);

      default:
        return TColor.gray;
    }
  }
}
