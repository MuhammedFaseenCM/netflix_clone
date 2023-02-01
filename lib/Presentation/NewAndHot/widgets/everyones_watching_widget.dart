import 'package:flutter/material.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';
import 'package:netflix_clone/Presentation/Widgets/video_widget.dart';
import 'package:netflix_clone/Presentation/home/widgets/top_bgimage.dart';
import 'package:share_plus/share_plus.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String posterPath;
  const EveryonesWatchingWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.posterPath,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight20,
        kHeight,
        kHeight20,
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        kHeight,
        Text(
          description,
          maxLines: 7,
          style: const TextStyle(color: greyColor),
        ),
        kHeight20,
        kHeight,
        kHeight20,
        VideoWidget(
          posterPath: posterPath,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Share.share("$title\n$description");
              },
              child: threeButtonsWidget(
                  icon: Icons.share,
                  text: "Share",
                  color: whiteColor,
                  iconsize: 25.0,
                  fontsize: 15.0),
            ),
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
