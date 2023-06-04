import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:multi_food_restaurants/common/color_extension.dart';
import 'package:readmore/readmore.dart';

import 'img_button.dart';

class UserReviewRow extends StatelessWidget {
  final bool isBottomActionBar;
  final VoidCallback? onCommentPress;
  final VoidCallback? onLikePress;
  final VoidCallback? onSharePress;

  const UserReviewRow({super.key, this.isBottomActionBar = false, this.onSharePress, this.onLikePress, this.onCommentPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  'assets/img/u1.png',
                  width: 50,
                  height: 50,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
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
                      "45 Reviews, 210 Followers",
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
          const SizedBox(
            height: 8,
          ),
          Row(children: [
            Text(
              "Rated",
              style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
            IgnorePointer(
              ignoring: true,
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                unratedColor: Colors.transparent,
                itemCount: 5,
                itemSize: 20,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: TColor.primary,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            Text(
              "4.0",
              style: TextStyle(
                  color: TColor.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Text(
              "2 Days ago",
              style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ]),
          const SizedBox(
            height: 8,
          ),
          ReadMoreText(
            'I enjoyed the food of the restaurant. The dishes are attractive and very beautiful. Good food, luxurious space and enthusiastic service. I will be back in the… I enjoyed the food of the restaurant. The dishes are attractive and very beautiful. Good food, luxurious space and enthusiastic service. I will be back in the…',
            trimLines: 4,
            colorClickableText: TColor.text,
            trimMode: TrimMode.Line,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: TColor.text),
            trimCollapsedText: 'Read more',
            trimExpandedText: 'Read less',
            moreStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: TColor.primary),
          ),
          const SizedBox(
            height: 8,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImgButton(
                  image: "assets/img/c1.png",
                  onPressed: () {},
                ),
                ImgButton(
                  image: "assets/img/c2.png",
                  onPressed: () {},
                ),
                ImgButton(
                  image: "assets/img/c3.png",
                  onPressed: () {},
                ),
                ImgButton(
                  image: "assets/img/l1.png",
                  isMore: true,
                  moreImageCount: 8,
                  onPressed: () {},
                ),
              ],
            ),
          ),
         
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if(onLikePress != null) {
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
