import 'package:flutter/material.dart';

import '../../common/color_extension.dart';

class LikeUserListView extends StatefulWidget {
  const LikeUserListView({super.key});

  @override
  State<LikeUserListView> createState() => _LikeUserListViewState();
}

class _LikeUserListViewState extends State<LikeUserListView> {
  TextEditingController txtComment = TextEditingController();

  List likeArr = [
    {
      "image": "assets/img/u1.png",
      "name": "Hibe Neted",
      "is_follow": "1",
      "reviews": "45",
      "followers": "201"
    },
    {
      "image": "assets/img/u2.png",
      "name": "Lija Paltala",
      "is_follow": "0",
      "reviews": "50",
      "followers": "75"
    },
    {
      "image": "assets/img/u1.png",
      "name": "Hibe Neted",
      "is_follow": "1",
      "reviews": "45",
      "followers": "201"
    },
    {
      "image": "assets/img/u2.png",
      "name": "Natalia Sonz",
      "is_follow": "1",
      "reviews": "45",
      "followers": "201"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "X Close",
                      style: TextStyle(
                          color: TColor.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: media.width * 0.9,
              height: media.height * 0.85,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black54, blurRadius: 5, spreadRadius: 2)
                  ]),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "4 Likes",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: TColor.text,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Photos",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: TColor.gray,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Divider(
                      color: Colors.black12,
                      height: 1,
                    ),
                    Expanded(
                      child: ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: likeArr.length,
                          separatorBuilder: (context, index) => const Divider(
                                color: Colors.black26,
                                height: 1,
                              ),
                          itemBuilder: (context, index) {
                            var lObj = likeArr[index] as Map? ?? {};

                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Image.asset(
                                      lObj["image"].toString(),
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          lObj["name"].toString(),
                                          style: TextStyle(
                                              color: TColor.text,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          "${lObj["reviews"].toString()} Reviews, ${lObj["followers"].toString()} Followers",
                                          style: TextStyle(
                                              color: TColor.gray,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (lObj["is_follow"].toString() == "1")
                                    Container(
                                      height: 20,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: TColor.primary),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        "Follow",
                                        style: TextStyle(
                                            color: TColor.primary,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )
                                ],
                              ),
                            );
                          }),
                    ),
                    const Divider(
                      color: Colors.black12,
                      height: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 8),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(17.5),
                            child: Container(
                              color: TColor.secondary,
                              child: Image.asset(
                                "assets/img/u1.png",
                                width: 35,
                                height: 35,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: TColor.gray.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(15)),
                              child: TextField(
                                controller: txtComment,
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 15),
                                    hintText: "Typing your comment",
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          ],
        )
      ],
    );
  }
}
