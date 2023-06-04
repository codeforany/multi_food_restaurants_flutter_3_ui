import 'package:flutter/material.dart';
import 'package:multi_food_restaurants/common/color_extension.dart';
import 'package:multi_food_restaurants/view/home/collection_list_view.dart';
import 'package:multi_food_restaurants/view/home/search_location_view.dart';
import 'package:multi_food_restaurants/view/home/trending_list_view.dart';

import '../../common_widget/collection_food_item_cell.dart';
import '../../common_widget/favorite_food_item_cell.dart';
import '../../common_widget/food_item_cell.dart';
import '../../common_widget/line_textfield.dart';
import '../../common_widget/popular_food_item_cell.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/selection_text_view.dart';
import '../restaurant/restaurant_detail_view.dart';
import 'outlet_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSelectCity = false;
  TextEditingController txtSearch = TextEditingController();

  List legendaryArr = [
    {
      "name": "Lombar Pizza",
      "address": "East 46th Street",
      "category": "Pizza, Italian",
      "image": "assets/img/l1.png"
    },
    {
      "name": "Sushi Bar",
      "address": "210 Salt Pond Rd.",
      "category": "Sushi, Japan",
      "image": "assets/img/l2.png"
    },
    {
      "name": "Steak House",
      "address": "East 46th Street",
      "category": "Steak, American",
      "image": "assets/img/l3.png"
    }
  ];
  List trendingArr = [
    {
      "name": "Seafood Lee",
      "address": "210 Salt Pond Rd.",
      "category": "Seafood, Spain",
      "image": "assets/img/t1.png"
    },
    {
      "name": "Egg Tomato",
      "address": "East 46th Street",
      "category": "Egg, Italian",
      "image": "assets/img/t2.png"
    },
    {
      "name": "Burger Hot",
      "address": "East 46th Street",
      "category": "Pizza, Italian",
      "image": "assets/img/t3.png"
    }
  ];
  List collectionsArr = [
    {"name": "Legendary food", "place": "34", "image": "assets/img/c1.png"},
    {"name": "Seafood", "place": "28", "image": "assets/img/c2.png"},
    {"name": "Fizza Meli", "place": "56", "image": "assets/img/c3.png"}
  ];

  List favoriteArr = [
    {"name": "American", "image": "assets/img/f1.png"},
    {"name": "France", "image": "assets/img/f2.png"},
    {"name": "Japan", "image": "assets/img/f3.png"},
    {"name": "health", "image": "assets/img/f4.png"},
    {"name": "American1", "image": "assets/img/f1.png"},
    {"name": "France1", "image": "assets/img/f2.png"},
    {"name": "Japan1", "image": "assets/img/f3.png"},
    {"name": "health1", "image": "assets/img/f4.png"}
  ];

  List popularArr = [
    {"outlets": "23", "image": "assets/img/logo1.png"},
    {"outlets": "16", "image": "assets/img/logo2.png"},
    {"outlets": "31", "image": "assets/img/logo3.png"},
    {"outlets": "60", "image": "assets/img/logo4.png"}
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.bg,
      body: isSelectCity
          ? NestedScrollView(
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
                        setState(() {
                          isSelectCity = false;
                        });
                      },
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New York City",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Your location",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: TColor.gray,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    actions: [
                      IconButton(
                        icon: Image.asset(
                          "assets/img/notification.png",
                          width: 24,
                          height: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            isSelectCity = false;
                          });
                        },
                      ),
                      IconButton(
                        icon: Image.asset(
                          "assets/img/add.png",
                          width: 24,
                          height: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            isSelectCity = false;
                          });
                        },
                      ),
                    ],
                  ),
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    elevation: 1,
                    pinned: false,
                    floating: true,
                    primary: false,
                    title: RoundTextField(
                      controller: txtSearch,
                      hitText: "Search for restaurants…",
                      leftIcon: Icon(Icons.search, color: TColor.gray),
                    ),
                  ),
                ];
              },
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO: Legendary food
                    SelectionTextView(
                      title: "Legendary food",
                      onSeeAllTap: () {},
                    ),
                    SizedBox(
                      height: media.width * 0.48,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          itemCount: legendaryArr.length,
                          itemBuilder: (context, index) {
                            var fObj = legendaryArr[index] as Map? ?? {};

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RestaurantDetailView(
                                              fObj: fObj,
                                            )));
                              },
                              child: FoodItemCell(
                                fObj: fObj,
                              ),
                            );
                          }),
                    ),

                    //TODO: Trending this week
                    SelectionTextView(
                      title: "Trending this week",
                      onSeeAllTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TrendingListView()  ) );
                      },
                    ),

                    SizedBox(
                      height: media.width * 0.48,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          itemCount: trendingArr.length,
                          itemBuilder: (context, index) {
                            var fObj = trendingArr[index] as Map? ?? {};

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RestaurantDetailView(
                                              fObj: fObj,
                                            )));
                              },
                              child: FoodItemCell(
                                fObj: fObj,
                              ),
                            );
                          }),
                    ),

                    //TODO: Collections by Capi
                    SelectionTextView(
                      title: "Collections by Capi",
                      onSeeAllTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CollectionListView()));
                      },
                    ),

                    SizedBox(
                      height: media.width * 0.6,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          itemCount: collectionsArr.length,
                          itemBuilder: (context, index) {
                            var fObj = collectionsArr[index] as Map? ?? {};

                            return CollectionFoodItemCell(
                              fObj: fObj,
                            );
                          }),
                    ),

                    //TODO: Favorite Cuisines
                    SelectionTextView(
                      title: "Favorite Cuisines",
                      onSeeAllTap: () {},
                    ),

                    SizedBox(
                      height: media.width * 0.47,
                      child: GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.55,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15),
                          itemCount: favoriteArr.length,
                          itemBuilder: (context, index) {
                            var fObj = favoriteArr[index] as Map? ?? {};

                            return FavoriteFoodItemCell(
                              fObj: fObj,
                              index: index,
                            );
                          }),
                    ),

                    //TODO: Popular brands
                    SelectionTextView(
                      title: "Popular brands",
                      onSeeAllTap: () {},
                    ),

                    SizedBox(
                      height: media.width * 0.42,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          itemCount: popularArr.length,
                          itemBuilder: (context, index) {
                            var fObj = popularArr[index] as Map? ?? {};

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          OutletListView(fObj: fObj)),
                                );
                              },
                              child: PopularFoodItemCell(
                                fObj: fObj,
                                index: index,
                              ),
                            );
                          }),
                    ),

                    const SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ))
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/img/home_page_icon.png",
                    width: media.width, height: media.width * .25),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Text(
                  "Hi, nice to meet you!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: TColor.text,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Text(
                  "Set your location to start exploring\nrestaurants around you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: TColor.gray,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.08,
                ),
                RoundButton(
                  title: "User current location",
                  type: RoundButtonType.primary,
                  onPressed: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchLocationView()));
                    setState(() {
                      isSelectCity = true;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
