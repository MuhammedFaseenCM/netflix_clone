import 'package:flutter/material.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';
import 'package:netflix_clone/Presentation/Widgets/button_widget.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            pussBootsPic,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(bottom: 10, right: 10, child: volumeButton())
      ],
    );
  }
}
