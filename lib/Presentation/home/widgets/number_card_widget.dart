import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';

class NumberCardWidget extends StatelessWidget {
  final int index;
  final String image;
  const NumberCardWidget({super.key, required this.image, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
              child: Container(
                width: 150,
                height: 203,
                decoration: BoxDecoration(
                    borderRadius: kRadius,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(image))),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 10,
          child: BorderedText(
            strokeColor: whiteColor,
            strokeWidth: 3.0,
            child: Text(
              "$index",
              style: const TextStyle(
                fontSize: 120,
                color: backgroundcolor ,
              ),
            ),
          ),
        )
      ],
    );
  }
}
