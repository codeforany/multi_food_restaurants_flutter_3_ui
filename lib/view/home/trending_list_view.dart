import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/near_by_list_row.dart';
import '../../common_widget/popup_layout.dart';
import '../discovery/filter_view.dart';

class TrendingListView extends StatefulWidget {
  const TrendingListView({super.key});

  @override
  State<TrendingListView> createState() => _TrendingListViewState();
}

class _TrendingListViewState extends State<TrendingListView> {
  List trandingArr = [
    {
      "name": "Seafood Lee",
      "address": "210 Salt Pond Rd.",
      "category": "Seafood, Spain",
      "image": "assets/img/t1.png",
      "time": "11:30AM to 11:00PM",
      "rate": 4.8
    },
    {
      "name": "Egg Tomato",
      "address": "East 46th Street",
      "category": "Egg, Italian",
      "image": "assets/img/t2.png",
      "time": "11:30AM to 11:00PM",
      "rate": 3.8
    },
    {
      "name": "Burger Hot",
      "address": "East 46th Street",
      "category": "Pizza, Italian",
      "image": "assets/img/t3.png",
      "time": "11:30AM to 11:00PM",
      "rate": 2.8
    },
    {
      "name": "Seafood Lee",
      "address": "210 Salt Pond Rd.",
      "category": "Seafood, Spain",
      "image": "assets/img/t1.png",
      "time": "11:30AM to 11:00PM",
      "rate": 5.0
    },
    {
      "name": "Egg Tomato",
      "address": "East 46th Street",
      "category": "Egg, Italian",
      "image": "assets/img/t2.png",
      "time": "11:30AM to 11:00PM",
      "rate": 4.8
    },
    {
      "name": "Burger Hot",
      "address": "East 46th Street",
      "category": "Pizza, Italian",
      "image": "assets/img/t3.png",
      "time": "11:30AM to 11:00PM",
      "rate": 4.8
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.bg,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: TColor.bg,
              elevation: 0,
              expandedHeight: media.width * 0.667,
              floating: false,
              centerTitle: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  width: media.width,
                  height: media.width * 0.667,
                  color: TColor.secondary,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Image.asset(
                        "assets/img/f1.png",
                        width: media.width,
                        height: media.width * 0.75,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: media.width,
                        height: media.width * 0.75,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.transparent, Colors.transparent, Colors.black87],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: media.width * 0.05, horizontal: 20),
                        child: const Text(
                          "Trending",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              leading: IconButton(
                icon: Image.asset(
                  "assets/img/back.png",
                  width: 24,
                  height: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Share",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ))
              ],
            ),
          ];
        },
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            ListView.builder(
                itemCount: trandingArr.length,
                itemBuilder: (context, index) {
                  var fObj = trandingArr[index] as Map? ?? {};
                  return NearByListRow(
                    fObj: fObj,
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "${trandingArr.length} Place",
                    style: TextStyle(
                        color: TColor.text,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context, PopupLayout(child: const FilterView()));
                    },
                    child: Text(
                      "Filter",
                      style: TextStyle(
                          color: TColor.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
