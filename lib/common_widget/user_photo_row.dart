import 'package:flutter/material.dart';
import 'package:multi_food_restaurants/common/color_extension.dart';

class UserPhotoRow extends StatelessWidget {
  final Map pObj;
  final VoidCallback? onCommentPress;
  final VoidCallback? onLikePress;
  final VoidCallback? onSharePress;

  const UserPhotoRow(
      {super.key,
      required this.pObj,
      this.onSharePress,
      this.onLikePress,
      this.onCommentPress});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/img/u1.png',
                    width: 50,
                    height: 50,
                  ),
                ),

                const SizedBox(width: 15,),
               
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hibe Neted",
                        style: TextStyle(
                            color: TColor.text,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "2 Days ago",
                        style: TextStyle(
                            color: TColor.gray,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
               
               
                Container(
                  height: 30,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: TColor.primary),
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    "Follow",
                    style: TextStyle(
                        color: TColor.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),

           ClipRect(
                child: Image.asset(
                  pObj["image"].toString(),
                  width: media.width,
                  height: media.width,
                  fit: BoxFit.cover,
                ),
              ),
             

          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (onLikePress != null) {
                    onLikePress!();
                  }
                },
                icon: Image.asset(
                  "assets/img/like.png",
                  width: 22,
                  height: 22,
                  fit: BoxFit.fitWidth,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (onCommentPress != null) {
                    onCommentPress!();
                  }
                },
                icon: Image.asset(
                  "assets/img/comments.png",
                  width: 22,
                  height: 22,
                  fit: BoxFit.fitWidth,
                ),
              ),
              IconButton(
                onPressed: () {
                  if (onSharePress != null) {
                    onSharePress!();
                  }
                },
                icon: Image.asset(
                  "assets/img/share.png",
                  width: 22,
                  height: 22,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const Spacer(),
              Text(
                "4 Likes",
                style: TextStyle(
                    color: TColor.gray,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                "3 Comments",
                style: TextStyle(
                    color: TColor.gray,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ],
          )
        ],
      ),
    );
  }
}
