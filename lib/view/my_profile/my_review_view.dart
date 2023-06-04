import 'package:flutter/material.dart';
import 'package:multi_food_restaurants/view/home/comment_list_view.dart';
import 'package:multi_food_restaurants/view/home/like_user_list_view.dart';
import 'package:multi_food_restaurants/view/my_profile/my_review_comment_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/popup_layout.dart';
import '../../common_widget/selection_button.dart';
import '../../common_widget/user_review_row.dart';

class MyReviewView extends StatefulWidget {
  const MyReviewView({super.key});

  @override
  State<MyReviewView> createState() => _MyReviewViewState();
}

class _MyReviewViewState extends State<MyReviewView> {
  var selectTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.bg,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 1,
              pinned: true,
              floating: false,
              centerTitle: false,
              leadingWidth: 0,
              title: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      "assets/img/back.png",
                      width: 25,
                      height: 25,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reviews",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: TColor.text,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Lombor Pizza",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: TColor.gray,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverAppBar(
              primary: false,
              floating: false,
              backgroundColor: Colors.white,
              expandedHeight: 70,
              elevation: 1,
              leading: Container(),
              leadingWidth: 0,
              flexibleSpace: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SelectionButton(
                        title: "Popular",
                        subTitle: "(203)",
                        onPressed: () {
                          setState(
                            () {
                              selectTab = 0;
                            },
                          );
                        },
                        isSelect: selectTab == 0),
                    SelectionButton(
                        title: "My Reviews",
                        subTitle: "(400)",
                        onPressed: () {
                          setState(
                            () {
                              selectTab = 1;
                            },
                          );
                        },
                        isSelect: selectTab == 1),
                    SelectionButton(
                        title: "All Reviews",
                        subTitle: "(1500)",
                        onPressed: () {
                          setState(
                            () {
                              selectTab = 2;
                            },
                          );
                        },
                        isSelect: selectTab == 2),
                  ],
                ),
              ),
            )
          ];
        },
        body: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 2),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyReviewCommentView()));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 1,  offset: Offset(0, 1))
                      ]),
                  child:  UserReviewRow(
                    isBottomActionBar: true,
                    onCommentPress: (){
                       Navigator.push(
                          context, PopupLayout(child: const CommentListView()));
              
                      
                    },
                    onLikePress: () {
                      Navigator.push(
                          context, PopupLayout(child: const LikeUserListView()));
                    },
                  ),
                ),
              );
            }),
      ),
    );
  }
}
