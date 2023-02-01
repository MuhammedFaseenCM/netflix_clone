import 'package:flutter/material.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:netflix_clone/Presentation/Widgets/button_widget.dart';

class VideoWidget extends StatelessWidget {
  final String posterPath;
  const VideoWidget({super.key, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            posterPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(
                  Icons.error,
                  color: whiteColor,
                ),
              );
            },
          ),
        ),
        Positioned(bottom: 10, right: 10, child: volumeButton())
      ],
    );
  }
}
