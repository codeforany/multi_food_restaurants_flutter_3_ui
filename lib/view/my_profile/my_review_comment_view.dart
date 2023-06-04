import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../common_widget/popup_layout.dart';
import '../../common_widget/user_review_row.dart';
import '../home/comment_list_view.dart';
import '../home/like_user_list_view.dart';

class MyReviewCommentView extends StatefulWidget {
  const MyReviewCommentView({super.key});

  @override
  State<MyReviewCommentView> createState() => _MyReviewCommentViewState();
}

class _MyReviewCommentViewState extends State<MyReviewCommentView> {
  TextEditingController txtComment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  Text(
                    "Reviews",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: TColor.text,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 1,
                          offset: Offset(0, 1))
                    ]),
                child:  UserReviewRow(
                  isBottomActionBar: true,
                   onCommentPress: () {
                    Navigator.push(
                        context, PopupLayout(child: const CommentListView()));
                  },
                  onLikePress: () {
                    Navigator.push(
                        context, PopupLayout(child: const LikeUserListView()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(17.5),
                child: Container(
                  color: TColor.secondary,
                  child: Image.asset(
                    "assets/img/u1.png",
                    width: 35,
                    height: 35,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 15,),
              Expanded(
                child: Container(
                  decoration:
                      BoxDecoration(color: TColor.gray.withOpacity(0.2), borderRadius: BorderRadius.circular(15)),
                    child: TextField(controller: txtComment, decoration: const InputDecoration(
                      contentPadding:  EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                      hintText: "Typing your comment",
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none
                    ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
