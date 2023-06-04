import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/collection_food_item_cell.dart';

class CollectionListView extends StatefulWidget {
  const CollectionListView({super.key});

  @override
  State<CollectionListView> createState() => _CollectionListViewState();
}

class _CollectionListViewState extends State<CollectionListView> {
  List collectionsArr = [
    {"name": "Legendary food", "place": "34", "image": "assets/img/c1.png"},
    {"name": "Seafood", "place": "28", "image": "assets/img/c2.png"},
    {"name": "Fizza Meli", "place": "56", "image": "assets/img/c3.png"},
    {"name": "Legendary food", "place": "34", "image": "assets/img/c1.png"},
    {"name": "Seafood", "place": "28", "image": "assets/img/c2.png"},
    {"name": "Fizza Meli", "place": "56", "image": "assets/img/c3.png"},
    {"name": "Legendary food", "place": "34", "image": "assets/img/c1.png"},
    {"name": "Seafood", "place": "28", "image": "assets/img/c2.png"},
    {"name": "Fizza Meli", "place": "56", "image": "assets/img/c3.png"}
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
              elevation: 0,
              pinned: true,
              floating: false,
              centerTitle: false,
              leading: IconButton(
                icon: Image.asset(
                  "assets/img/back.png",
                  width: 24,
                  height: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Collections",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: TColor.text,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "By Copi Restaurant",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: TColor.gray,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ];
        },
        body: GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                childAspectRatio: 0.7,
                mainAxisSpacing: 0),
            itemCount: collectionsArr.length,
            itemBuilder: (context, index) {
              var fObj = collectionsArr[index] as Map? ?? {};

              return CollectionFoodItemCell(
                fObj: fObj,
                isGrid: true,
              );
            }),
      ),
    );
  }
}
