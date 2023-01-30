import 'package:flutter/material.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';
import 'package:netflix_clone/Presentation/Widgets/video_widget.dart';
import 'package:netflix_clone/Presentation/home/widgets/top_bgimage.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight20,
        kHeight,
        kHeight20,
        const Text(
          "Friends",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          "Six young people from New York City, on their own and struggling to survive in the real world, find the companionship, comfort and support in the real world, find the companionship, confort and support they get from each other to be the perfect antidote to the pressure of life.",
          style: TextStyle(color: greyColor),
        ),
        kHeight20,
        kHeight,
        kHeight20,
        const VideoWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            threeButtonsWidget(
                icon: Icons.share,
                text: "Share",
                color: whiteColor,
                iconsize: 25.0,
                fontsize: 15.0),
            kWidth,
            threeButtonsWidget(
                icon: Icons.add,
                text: "My List",
                color: whiteColor,
                iconsize: 25.0,
                fontsize: 15.0),
            kWidth,
            threeButtonsWidget(
                icon: Icons.play_arrow,
                text: "Play",
                color: whiteColor,
                iconsize: 25.0,
                fontsize: 15.0),
            kWidth
          ],
        )
      ],
    );
  }
}