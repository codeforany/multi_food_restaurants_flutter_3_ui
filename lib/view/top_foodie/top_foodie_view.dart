import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/selection_button.dart';
import '../../common_widget/top_foodies_user_row.dart';

class TopFoodieView extends StatefulWidget {
  const TopFoodieView({super.key});

  @override
  State<TopFoodieView> createState() => _TopFoodieViewState();
}

class _TopFoodieViewState extends State<TopFoodieView> {
  var selectTab = 0;

  List reviewsArr = [
    {
      "name": "Jaysen Terrell",
      "images": "assets/img/u1.png",
      "reviews": "385",
      "photos": "145",
      "type": "Diamond Foodie",
      "is_follow": "1",
      "rank": "1",
    },
    {
      "name": "Hibe Neted",
      "images": "assets/img/u2.png",
      "reviews": "89",
      "photos": "75",
      "type": "Gold Foodie",
      "is_follow": "0",
      "rank": "2",
    },
    {
      "name": "Lilja Peltola",
      "images": "assets/img/u1.png",
      "reviews": "120",
      "photos": "456",
      "type": "Gold Foodie",
      "is_follow": "1",
      "rank": "2",
    },
    {
      "name": "Natalia Sanz",
      "images": "assets/img/u2.png",
      "reviews": "452",
      "photos": "23",
      "type": "Silver Foodie",
      "is_follow": "1",
      "rank": "3",
    },
    {
      "name": "Emeline Duarte",
      "images": "assets/img/u1.png",
      "reviews": "156",
      "photos": "47",
      "type": "Silver Foodie",
      "is_follow": "0",
      "rank": "3",
    },
    {
      "name": "Mylan Pierre",
      "images": "assets/img/u1.png",
      "reviews": "156",
      "photos": "47",
      "type": "Silver Foodie",
      "is_follow": "0",
      "rank": "3",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.bg,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              pinned: true,
              floating: false,
              centerTitle: false,
              leadingWidth: 0,
              title: Row(
                children: [
                  Image.asset(
                    "assets/img/top_foodies.png",
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Top Foodies",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: TColor.text,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SliverAppBar(
              primary: false,
              floating: false,
              backgroundColor: Colors.white,
              expandedHeight: 70,
              elevation: 1,
              flexibleSpace: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ]),
                child: Row(
                  children: [
                    SelectionButton(
                        title: "Reviews",
                        subTitle: "(Top 50)",
                        onPressed: () {
                          setState(
                            () {
                              selectTab = 0;
                            },
                          );
                        },
                        isSelect: selectTab == 0),
                    SelectionButton(
                        title: "Photos",
                        subTitle: "(Top 50)",
                        onPressed: () {
                          setState(
                            () {
                              selectTab = 1;
                            },
                          );
                        },
                        isSelect: selectTab == 1),
                    SelectionButton(
                        title: "Bloggers",
                        subTitle: "(Top 30)",
                        onPressed: () {
                          setState(
                            () {
                              selectTab = 2;
                            },
                          );
                        },
                        isSelect: selectTab == 2),
                  ],
                ),
              ),
            )
          ];
        },
        body: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 4),
            itemCount: reviewsArr.length,
            itemBuilder: (context, index) {
              var uObj = reviewsArr[index] as Map? ?? {};

              return TopFoodiesUserRow(
                uObj: uObj,
              );
            }),
      ),
    );
  }
}
