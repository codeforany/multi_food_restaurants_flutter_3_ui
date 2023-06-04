import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/icon_text_button.dart';
import '../../common_widget/menu_row.dart';
import 'my_level_view.dart';
import 'my_network_view.dart';
import 'my_review_view.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({super.key});

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.bg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Edit",
              style: TextStyle(
                  color: TColor.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: media.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 1)]),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(media.width * 0.125),
                      child: Container(
                        color: TColor.secondary,
                        child: Image.asset(
                          "assets/img/u1.png",
                          width: media.width * 0.25,
                          height: media.width * 0.25,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.04,
                    ),
                    Text(
                      "Lilja Peltola",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: TColor.text,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: media.width * 0.025,
                    ),
                    Text(
                      "New York City",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: TColor.gray,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                  ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 1)]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconTextButton(
                    icon: "assets/img/network.png",
                    title: "Network",
                    subTitle: "603",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyNetworkView()));
                    },
                  ),
                  IconTextButton(
                    icon: "assets/img/review.png",
                    title: "My Reviews",
                    subTitle: "953",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyReviewView()));
                    },
                  ),
                  IconTextButton(
                    icon: "assets/img/my_level.png",
                    title: "My Level",
                    subTitle: "Sliver",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyLevelView()));
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 1)]),
              child: Column(
                children: [
                  MenuRow(
                    icon: "assets/img/payment.png",
                    title: "Manage Payment Option",
                    onPressed: () {},
                  ),
                  const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),
                  MenuRow(
                    icon: "assets/img/find_friends.png",
                    title: "Find Friends on Capi",
                    onPressed: () {},
                  ),
                  const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),
                  MenuRow(
                    icon: "assets/img/settings.png",
                    title: "More Settings",
                    onPressed: () {},
                  ),
                  const Divider(
                    color: Colors.black26,
                    height: 1,
                  ),
                  MenuRow(
                    icon: "assets/img/sign_out.png",
                    title: "Sign Out",
                    onPressed: () {},
                  ),
                  const Divider(
                    color: Colors.black26,
                    height: 1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
