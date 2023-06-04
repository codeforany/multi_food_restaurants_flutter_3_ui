import 'package:flutter/material.dart';
import 'package:multi_food_restaurants/common/extension.dart';

import '../../common/color_extension.dart';
import '../../common_widget/line_textfield.dart';

class SearchLocationView extends StatefulWidget {
  const SearchLocationView({super.key});

  @override
  State<SearchLocationView> createState() => _SearchLocationViewState();
}

class _SearchLocationViewState extends State<SearchLocationView> {
  TextEditingController txtSearch = TextEditingController();
  List recentlyArr = [
    {
      "name": "United States",
      "emoji": "🇺🇸",
      "city": [
        {"name": "New York City", "state": "NY"},
        {"name": "New Orleans", "state": "LA"},
        {"name": "New Haven", "state": "CT"},
        {"name": "New Bedford", "state": "MA"},
        {"name": "Newark", "state": "NJ"}
      ]
    },
    {"name": "Australia", "emoji": "🇦🇺"},
    {"name": "France", "emoji": "🇫🇷"},
    {"name": "Brazil", "emoji": "🇧🇷"},
    {"name": "Canada", "emoji": "🇨🇦"},
    {"name": "Japan", "emoji": "🇯🇵"}
  ];

  List searchResultArr = [
    {
      "name": "United States",
      "emoji": "🇺🇸",
      "city": [
        {"name": "New York City", "state": "NY"},
        {"name": "New Orleans", "state": "LA"},
        {"name": "New Haven", "state": "CT"},
        {"name": "New Bedford", "state": "MA"},
        {"name": "Newark", "state": "NJ"}
      ]
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    txtSearch.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: Image.asset(
            "assets/img/back.png",
            width: 24,
            height: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
            endEditing();
          },
        ),
        title: Text(
          "User current location",
          style: TextStyle(
              color: TColor.text, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LineTextField(
            controller: txtSearch,
            hitText: "Search the city…",
            isClear: true,
            onClearPressed: () {
              setState(() {
                txtSearch.text = "";
              });
            },
          ),
          SizedBox(
            height: media.width * 0.04,
          ),
          if (txtSearch.text.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Recently visited countries",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: TColor.text,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
          if (txtSearch.text.isEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: recentlyArr.length,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                itemBuilder: (context, index) {
                  var rObj = recentlyArr[index] as Map? ?? {};
                  return Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: TColor.gray, width: 0.5))),
                    child: Row(
                      children: [
                        Text(
                          rObj["emoji"].toString(),
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            rObj["name"].toString(),
                            style: TextStyle(
                                color: TColor.text,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: TColor.gray,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          if (txtSearch.text.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: searchResultArr.length,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                itemBuilder: (context, index) {
                  var rObj = searchResultArr[index] as Map? ?? {};
                  var cArr = rObj["city"] as List? ?? [];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: TColor.gray, width: 0.5))),
                        child: Row(
                          children: [
                            Text(
                              rObj["emoji"].toString(),
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Text(
                                rObj["name"].toString(),
                                style: TextStyle(
                                    color: TColor.text,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: TColor.gray,
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: cArr.map((cObj) {
                          return Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: TColor.gray, width: 0.5),),),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    cObj["name"].toString(),
                                    style: TextStyle(
                                        color: TColor.text,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  color: TColor.gray,
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
