import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:multi_food_restaurants/view/discovery/near_by_map_list_view.dart';
import 'package:widget_mask/widget_mask.dart';

import '../../common/color_extension.dart';
import '../../common_widget/discovery_cell.dart';
import '../../common_widget/line_textfield.dart';
import '../../common_widget/near_by_list_row.dart';
import '../../common_widget/popup_layout.dart';
import 'filter_view.dart';

class DiscoveryView extends StatefulWidget {
  const DiscoveryView({super.key});

  @override
  State<DiscoveryView> createState() => _DiscoveryViewState();
}

class _DiscoveryViewState extends State<DiscoveryView> {

  List listArr = [
    {
      "name":"Nearby",
      "place":"34",
      "image":"assets/img/nearby_dis.png",
    },
    {
      "name": "Desserts & Bakes",
      "place": "28",
      "image": "assets/img/desserts_bakes_disc.png",
    },
    {
      "name": "Dining Out",
      "place": "28",
      "image": "assets/img/dining_out_dis.png",
    },
    {
      "name":"Drinks & Nigtlife",
      "place":"42",
      "image":"assets/img/drink_dis.png",
    },
    {
      "name": "Cafes & More",
      "place": "29",
      "image": "assets/img/coff_dis.png",
    },
    {
      "name": "Take-Away",
      "place": "21",
      "image": "assets/img/take_away_dis.png",
    },
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
              backgroundColor: Colors.white,
              elevation: 0,
              pinned: true,
              floating: false,
              centerTitle: false,
              leadingWidth: 0,
              title: Row(
                children: [
                  Image.asset(
                    "assets/img/discovery_icon.png",
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Discovery",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: TColor.text,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ];
        },
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1),
            itemCount: listArr.length,
            itemBuilder: (context, index) {
              var fObj = listArr[index] as Map? ?? {};
              return  GestureDetector(
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NearByMapListView() ) );
                },
                child: DiscoveryCell(fObj: fObj,)) ;
            }),
      ),
    );
  }
}
