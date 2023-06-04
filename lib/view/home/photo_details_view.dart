import 'package:flutter/material.dart';
import 'package:multi_food_restaurants/view/home/comment_list_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/popup_layout.dart';
import '../../common_widget/user_photo_row.dart';
import 'like_user_list_view.dart';

class PhotoDetailsView extends StatefulWidget {
  final String img;
  const PhotoDetailsView({super.key, required this.img});

  @override
  State<PhotoDetailsView> createState() => _PhotoDetailsViewState();
}

class _PhotoDetailsViewState extends State<PhotoDetailsView> {
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
                  Text(
                    "Photo",
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
                color: Colors.white,
                child: UserPhotoRow(
                  pObj: {"image": widget.img},
                  onCommentPress: () {
                    Navigator.push(
                        context, PopupLayout(child: const CommentListView()));
                  },
                  onLikePress: (){

                    Navigator.push(
                        context, PopupLayout(child: const LikeUserListView()));
                    

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
