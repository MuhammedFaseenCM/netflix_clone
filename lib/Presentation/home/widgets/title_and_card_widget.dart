import 'package:flutter/material.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';
import 'package:netflix_clone/Presentation/Search/widgets/search_title.dart';
import 'package:netflix_clone/Presentation/home/widgets/number_card_widget.dart';
import 'package:netflix_clone/Presentation/home/widgets/vertical_scroll_card.dart';


class TitleandCardWidget extends StatelessWidget {
  final String title;
  final String image;
  final bool numbercard;
  const TitleandCardWidget(
      {Key? key,
      required this.title,
      required this.image,
      this.numbercard = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: title),
        kHeight,
        LimitedBox(
          maxHeight: 203,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) {
              if (numbercard == true) {
                return NumberCardWidget(image: image, index: index + 1);
              } else {
                return VerticalScrollCard(image: image);
              }
            }
                // VerticalScrollCard(
                //   image: image,
                // ),
                ),
          ),
        ),
        kHeight20,
      ],
    );
  }
}
