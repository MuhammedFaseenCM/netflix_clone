import 'package:flutter/material.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';
import 'package:netflix_clone/Presentation/Widgets/video_widget.dart';
import 'package:netflix_clone/Presentation/home/widgets/top_bgimage.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterpath;
  final String movieName;
  final String description;

  const ComingSoonWidget(
      {super.key,
      required this.id,
      required this.month,
      required this.day,
      required this.posterpath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          height: 500,
          child: Column(
            children:  [
              Text(
                month,
                style:const TextStyle(color: greyColor),
              ),
              Text(
                day,
                style:const TextStyle(
                    fontSize: 30,
                    letterSpacing: 4.0,
                    fontWeight: FontWeight.w900),
              )
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(posterPath: posterpath),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        movieName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -5),
                      ),
                    ),
                    Row(
                      children: [
                        threeButtonsWidget(
                            icon: Icons.notifications,
                            text: "Remind me",
                            color: whiteColor,
                            iconsize: 20.0,
                            fontsize: 12.0),
                        threeButtonsWidget(
                            icon: Icons.info,
                            text: "Info",
                            color: whiteColor,
                            iconsize: 20.0,
                            fontsize: 12.0)
                      ],
                    ),
                  ],
                ),
                Text("Coming on $month $day"),
                kHeight20,
                Text(
                  movieName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  maxLines: 7,
                  style: const TextStyle(color: greyColor),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
