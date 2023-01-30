import 'package:flutter/material.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';
import 'package:netflix_clone/Presentation/Widgets/button_widget.dart';

class VideoListItem extends StatelessWidget {
  final index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Left side

                volumeButton(),

                //Right side

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(dogPic),
                      ),
                    ),
                    VideoActionsWidget(
                        icon: Icons.emoji_emotions, title: 'LOL'),
                    VideoActionsWidget(icon: Icons.add, title: 'My list'),
                    VideoActionsWidget(icon: Icons.share, title: 'Share'),
                    VideoActionsWidget(icon: Icons.play_circle, title: 'Play')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: whiteColor,
          size: 30,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        kHeight
      ],
    );
  }
}


