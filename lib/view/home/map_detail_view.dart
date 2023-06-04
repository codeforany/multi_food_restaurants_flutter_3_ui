import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_mask/widget_mask.dart';

import '../../common/color_extension.dart';
import '../../common_widget/line_textfield.dart';

class MapDetailView extends StatefulWidget {
  const MapDetailView({super.key});

  @override
  State<MapDetailView> createState() => _MapDetailViewState();
}

class _MapDetailViewState extends State<MapDetailView> {
  TextEditingController txtSearch = TextEditingController();
  GoogleMapController? _controller;

  final locations = const [
    LatLng(37.42796133580664, -122.085749655962),
  ];

  late List<MarkerData> _customMarkers;

  bool isListView = false;

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.42796133580664, -122.085749655962),
      // tilt: 59.440717697143555,
      zoom: 14.151926040649414);

  Map fObj = {
    "name": "Lombar Pizza",
    "address": "East 46th Street",
    "category": "Pizza, Italian",
    "image": "assets/img/l1.png",
    "time": "11:30AM to 11:00PM",
    "rate": 4.8
  };

  @override
  void initState() {
    super.initState();
    _customMarkers = [
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-1'), position: locations[0]),
          child: _customMarker('Everywhere\nis a Widgets', Colors.blue)),
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
                    "Map",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: TColor.text,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Lombar Pizza",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: TColor.gray,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ];
        },
        body: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
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
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: const Color(0xffE8E8E8),
                        borderRadius: BorderRadius.circular(15)),
                    child: RoundTextField(
                      controller: txtSearch,
                      hitText: "Search for restaurants…",
                      leftIcon: Icon(Icons.search, color: TColor.gray),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 2, offset: Offset(0, -2))
              ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            fObj["image"].toString(),
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    fObj["name"].toString(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: TColor.text,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: TColor.primary,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    fObj["rate"].toString(),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                            
                            Text(
                              fObj["address"].toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: TColor.gray,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                          
                                Text(
                                  fObj["category"].toString(),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: TColor.gray,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                             

                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              fObj["time"].toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: TColor.gray,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),

                            const SizedBox(
                              height: 4,
                            ),



                          ],
                        ),
                      )
                    ],
                  ),
               
                  TextButton.icon(onPressed: (){

                  }, icon: Image.asset("assets/img/mapView.png", width: 25,  ), label:  Text(
                      "Open in Apple Maps",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: TColor.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
