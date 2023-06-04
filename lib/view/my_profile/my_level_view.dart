import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../common/color_extension.dart';
import '../../common_widget/title_subtitle_label.dart';

class MyLevelView extends StatefulWidget {
  const MyLevelView({super.key});

  @override
  State<MyLevelView> createState() => _MyLevelViewState();
}

class _MyLevelViewState extends State<MyLevelView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.bg,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: TColor.color2,
              elevation: 0,
              expandedHeight: media.width * 0.80,
              pinned: true,
              floating: false,
              centerTitle: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  width: media.width,
                  height: media.width * 0.80,
                  color: TColor.color2,
                  child: Container(
                      padding: EdgeInsets.only(top: media.width * 0.34),
                      height: media.width * 0.8,
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/img/trophy.png",
                              width: media.width * 0.35,
                              fit: BoxFit.fitWidth,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Sliver Level",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      )),
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
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 1)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "View My Level",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: TColor.text,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        TitleSubTitleLabel(
                          title: "953",
                          subtitle: "Reviews",
                        ),
                        TitleSubTitleLabel(
                          title: "358",
                          subtitle: "Comments",
                        ),
                        TitleSubTitleLabel(
                          title: "216",
                          subtitle: "Photos",
                        ),
                        TitleSubTitleLabel(
                          title: "603",
                          subtitle: "follower",
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
              ,

              Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 1)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),

                     LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                     barRadius:  Radius.circular(7.5),
                      lineHeight: 15,
                      percent: 0.35,
                      progressColor: TColor.primary,
                      backgroundColor: TColor.gray.withOpacity(0.4),
                    ),
                    
                   
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        TitleSubTitleLabel(
                          title: "Sliver Level",
                          subtitle: "1205 Point",
                          textAlign: TextAlign.left,
                          fontSizeTitle: 12,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        TitleSubTitleLabel(
                          title: "Gold Level",
                          subtitle: "1500",
                          textAlign: TextAlign.right,
                          fontSizeTitle: 12,
                          crossAxisAlignment: CrossAxisAlignment.end,
                        ),
                        
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
