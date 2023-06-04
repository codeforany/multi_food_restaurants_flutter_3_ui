import 'package:flutter/material.dart';
import 'package:multi_food_restaurants/common_widget/round_button.dart';

import '../../common/color_extension.dart';
import '../../common_widget/filter_row.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  bool isOpenNow = false;
  bool isReted4Plus = false;
  bool isReted3Plus = false;

  int selectSortType = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [

              Padding(
                padding: const EdgeInsets.symmetric( horizontal: 15),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "X Close",
                        style: TextStyle(
                            color: TColor.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),)
                ],
                          ),
              ),

            Container(
              width: media.width * 0.9,
              height: media.height * 0.85,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(color: Colors.black54, blurRadius: 5, spreadRadius: 2)
                  ]),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Filter",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Tending",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: TColor.gray,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isOpenNow = false;
                          isReted3Plus = false;
                          isReted4Plus = false;
                          selectSortType = 0;
                        });
                      },
                      child: Text(
                        "Reset",
                        style: TextStyle(
                            color: TColor.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                const Divider(
                  color: Colors.black26,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Quick filter",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: TColor.gray,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                FilterRow(
                  title: "Open now",
                  icon: isOpenNow
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank_outlined,
                  iconColor: isOpenNow ? TColor.primary : TColor.gray,
                  onPressed: () {
                    setState(() {
                      isOpenNow = !isOpenNow;
                    });
                  },
                ),
                FilterRow(
                  title: "Rated 4+",
                  icon: isReted4Plus
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank_outlined,
                  iconColor: isReted4Plus ? TColor.primary : TColor.gray,
                  onPressed: () {
                    setState(() {
                      isReted4Plus = !isReted4Plus;
                    });
                  },
                ),
                FilterRow(
                  title: "Rated 3+",
                  icon: isReted3Plus
                      ? Icons.check_box_outlined
                      : Icons.check_box_outline_blank_outlined,
                  iconColor: isReted3Plus ? TColor.primary : TColor.gray,
                  onPressed: () {
                    setState(() {
                      isReted3Plus = !isReted3Plus;
                    });
                  },
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Sort By",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: TColor.gray,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                 FilterRow(
                  title: "Nearest to me",
                  icon: selectSortType == 1
                       ? Icons.radio_button_checked_outlined
                      : Icons.radio_button_off_outlined,
                  iconColor:  selectSortType == 1 ? TColor.primary : TColor.gray,
                  onPressed: () {
                    setState(() {
                      selectSortType = 1;
                    });
                  },
                ),
                FilterRow(
                  title: "Cost high to low",
                  icon: selectSortType == 2
                      ? Icons.radio_button_checked_outlined
                      : Icons.radio_button_off_outlined,
                  iconColor: selectSortType == 2 ? TColor.primary : TColor.gray,
                  onPressed: () {
                    setState(() {
                      selectSortType = 2;
                    });
                  },
                ),
                FilterRow(
                  title: "Cost low to high",
                  icon: selectSortType == 3
                      ? Icons.radio_button_checked_outlined
                      : Icons.radio_button_off_outlined,
                  iconColor: selectSortType == 3 ? TColor.primary : TColor.gray,
                  onPressed: () {
                    setState(() {
                      selectSortType = 3;
                    });
                  },
                ),
                const Spacer(),
                RoundButton(
                    title: "Apply",
                    type: RoundButtonType.primary,
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                const SizedBox(
                  height: 4,
                ),
              ]),
            ),
          ],
        )
      ],
    );
  }
}
