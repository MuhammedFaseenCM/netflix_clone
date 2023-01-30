import 'package:flutter/material.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';

Widget volumeButton() {
  return CircleAvatar(
      radius: 30,
      backgroundColor: backgroundcolor.withOpacity(0.5),
      child: IconButton(onPressed: () {}, icon: const Icon(Icons.volume_off)));
}

Widget myListButton() => IconButton(
      onPressed: () {},
      icon: const Icon(Icons.add),
      iconSize: 30,
      color: whiteColor,
    );
