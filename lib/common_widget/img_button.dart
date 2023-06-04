import 'package:flutter/material.dart';

class ImgButton extends StatelessWidget {
  final String image;
  final bool isMore;
  final int moreImageCount;
  final VoidCallback onPressed;
  const ImgButton(
      {super.key,
      required this.image,
      required this.onPressed,
      this.isMore = false,
      this.moreImageCount = 0});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(right: media.width * 0.04),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                image,
                width: media.width * 0.20,
                height: media.width * 0.20,
                fit: BoxFit.cover,
              ),
            ),
            if (isMore)
              Container(
                width: media.width * 0.20,
                height: media.width * 0.20,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            if (isMore)
            
              Column(
                children: [
                  Text(
                    "+$moreImageCount",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),

                   const Text(
                    "Photos",
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
