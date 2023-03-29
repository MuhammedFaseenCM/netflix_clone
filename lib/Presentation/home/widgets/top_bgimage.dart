import 'package:flutter/material.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';
import 'package:netflix_clone/Presentation/home/screen_home.dart';

class TopBGImageandWidgets extends StatelessWidget {
  final String imageUrl;
  const TopBGImageandWidgets({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration:  BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                threeButtonsWidget(
                    color: whiteColor, icon: Icons.add, text: "My List"),
                threeButtonsWidget(
                    buttonColor: whiteColor,
                    color: backgroundcolor,
                    icon: Icons.play_arrow,
                    text: "Play",
                    button: true),
                threeButtonsWidget(
                    color: whiteColor, icon: Icons.info, text: "Info")
              ],
            ),
          ),
        )
      ],
    );
  }
}

Widget threeButtonsWidget(
    {required icon,
    required text,
    buttonColor,
    required color,
    bool button = false,
    iconsize,
    fontsize}) {
  if (button == false) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon),
          iconSize: iconsize ?? 30,
          color: color,
        ),
        Text(text, style: TextStyle(fontSize: fontsize ?? 20, color: color))
      ],
    );
  } else {
    return TextButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonColor)),
        onPressed: () {},
        icon: Icon(
          icon,
          size: 25,
          color: color,
        ),
        label: Text(
          text,
          style: TextStyle(fontSize: 20, color: color),
        ));
  }
}
