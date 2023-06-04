import 'package:flutter/material.dart';
import 'package:multi_food_restaurants/common/color_extension.dart';
import 'package:multi_food_restaurants/view/login/login_view.dart';

import '../../common_widget/round_button.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;

  PageController? controller = PageController();

  List infoArr = [
    {
      "title": "Quick search",
      "sub_title":
          "Set your location to start exploring\nrestaurants around you",
      "icon": "assets/img/1.png"
    },
    {
      "title": "Search for a place",
      "sub_title":
          "Set your location to start exploring\nrestaurants around you",
      "icon": "assets/img/2.png"
    },
    {
      "title": "Variety of food",
      "sub_title":
          "Set your location to start exploring\nrestaurants around you",
      "icon": "assets/img/3.png"
    },
    {
      "title": "Fast shipping",
      "sub_title":
          "Set your location to start exploring\nrestaurants around you",
      "icon": "assets/img/4.png"
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    controller?.addListener(() {
      selectPage = controller?.page?.round() ?? 0;
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
      backgroundColor: TColor.primary,
      body: SafeArea(
        child: Stack(children: [
          PageView.builder(
              controller: controller,
              itemCount: infoArr.length,
              itemBuilder: (context, index) {
                var iObj = infoArr[index] as Map? ?? {};

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      iObj["icon"].toString(),
                      width: media.width * 0.5,
                      height: media.width * 0.5,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    Text(
                      iObj["title"].toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: media.width * 0.03,
                    ),
                    Text(
                      iObj["sub_title"].toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                );
              }),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RoundButton(
                title: "Login",
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView() ) );

                },
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: infoArr.map((iObj) {
                  var index = infoArr.indexOf(iObj);

                  return Container(
                      margin: const EdgeInsets.all(8),
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          color: selectPage == index
                              ? Colors.white
                              : Colors.white54,
                          borderRadius: BorderRadius.circular(7.5)));
                }).toList(),
              )
            ],
          )
        ]),
      ),
    );
  }
}
