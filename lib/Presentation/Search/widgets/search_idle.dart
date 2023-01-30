import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';
import 'package:netflix_clone/Presentation/downloads/widgets/screen_downloads.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(fishingPic))),
        ),
        kWidth,
        const Expanded(
            child: Text(
          "data",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const Icon(
          CupertinoIcons.play_circle,
          color: whiteColor,
          size: 50,
        )
      ],
    );
  }
}
