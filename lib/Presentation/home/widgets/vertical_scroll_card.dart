import 'package:flutter/material.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';

class VerticalScrollCard extends StatelessWidget {
  final String image;
  const VerticalScrollCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      child: Container(
        width: 150,
        height: 203,
        decoration: BoxDecoration(
            borderRadius: kRadius,
            image:
                DecorationImage(fit: BoxFit.cover, image: NetworkImage(image))),
      ),
    );
  }
}
