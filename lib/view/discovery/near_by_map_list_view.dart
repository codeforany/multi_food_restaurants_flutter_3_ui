import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_mask/widget_mask.dart';

import '../../common/color_extension.dart';
import '../../common_widget/line_textfield.dart';
import '../../common_widget/near_by_list_row.dart';
import '../../common_widget/popup_layout.dart';
import 'filter_view.dart';

class NearByMapListView extends StatefulWidget {
  const NearByMapListView({super.key});

  @override
  State<NearByMapListView> createState() => _NearByMapListViewState();
}

class _NearByMapListViewState extends State<NearByMapListView> {
  TextEditingController txtSearch = TextEditingController();
  GoogleMapController? _controller;

  final locations = const [
    LatLng(37.42796133580664, -122.085749655962),
    LatLng(37.41796133580664, -122.085749655962),
    LatLng(37.43796133580664, -122.085749655962),
    LatLng(37.42796133580664, -122.095749655962),
    LatLng(37.42796133580664, -122.075749655962),
  ];

  late List<MarkerData> _customMarkers;

  bool isListView = false;

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.42796133580664, -122.085749655962),
      // tilt: 59.440717697143555,
      zoom: 14.151926040649414);

  List nearbyArr = [
    {
      "name": "Lombar Pizza",
      "address": "East 46th Street",
      "category": "Pizza, Italian",
      "image": "assets/img/l1.png",
      "time": "11:30AM to 11:00PM",
      "rate": 4.8
    },
    {
      "name": "Sushi Bar",
      "address": "210 Salt Pond Rd.",
      "category": "Sushi, Japan",
      "image": "assets/img/l2.png",
      "time": "11:30AM to 11:00PM",
      "rate": 3.8
    },
    {
      "name": "Steak House",
      "address": "East 46th Street",
      "category": "Steak, American",
      "image": "assets/img/l3.png",
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
  void initState() {
    super.initState();
    _customMarkers = [
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-1'), position: locations[0]),
          child: _customMarker('Everywhere\nis a Widgets', Colors.blue)),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-5'), position: locations[4]),
          child: _customMarker('A', Colors.black)),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-2'), position: locations[1]),
          child: _customMarker('B', Colors.red)),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-3'), position: locations[2]),
          child: _customMarker('C', Colors.green)),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-4'), position: locations[3]),
          child: _customMarker('D', Colors.purple)),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-5'), position: locations[4]),
          child: _customMarker('A', Colors.blue)),
    ];
  }

  _customMarker(String symbol, Color color) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: TColor.primary),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "Lombar Pizza",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: TColor.text,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
          ),
          WidgetMask(
            blendMode: BlendMode.dstIn,
            mask: Image.asset(
              'assets/img/image_marsk.png',
              width: 70,
              fit: BoxFit.contain,
            ),
            child: Image.asset(
              'assets/img/l1.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }

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
                    "Nearby",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: TColor.text,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "34 Place",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: TColor.gray,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: IconButton(
                    icon: Image.asset(
                      isListView
                          ? "assets/img/mapView.png"
                          : "assets/img/filter.png",
                      width: 24,
                      height: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        isListView = !isListView;
                      });
                    },
                  ),
                ),
              ],
            ),
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              pinned: false,
              floating: true,
              primary: false,
              expandedHeight: 90,
              flexibleSpace: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/img/map_pin.png',
                          width: 15,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "New York City",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    RoundTextField(
                      controller: txtSearch,
                      hitText: "Search for restaurants…",
                      leftIcon: Icon(Icons.search, color: TColor.gray),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            if (!isListView)
              CustomGoogleMapMarkerBuilder(
                //screenshotDelay: const Duration(seconds: 4),
                customMarkers: _customMarkers,
                builder: (BuildContext context, Set<Marker>? markers) {
                  if (markers == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kLake,
                    compassEnabled: false,
                    gestureRecognizers: Set()
                      ..add(Factory<PanGestureRecognizer>(
                        () => PanGestureRecognizer(),
                      )),
                    markers: markers,
                    onMapCreated: (GoogleMapController controller) {
                      _controller = controller;
                    },
                  );
                },
              ),
            if (isListView)
              ListView.builder(
                  itemCount: nearbyArr.length,
                  itemBuilder: (context, index) {
                    var fObj = nearbyArr[index] as Map? ?? {};
                    return NearByListRow(
                      fObj: fObj,
                    );
                  }),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
