import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/Presentation/Widgets/app_bar_widget.dart';
import 'package:netflix_clone/Presentation/downloads/widgets/section1_widget.dart';
import 'package:netflix_clone/Presentation/downloads/widgets/section2_widget.dart';
import 'package:netflix_clone/Presentation/downloads/widgets/section3_widget.dart';

final List imageList = [
  "https://www.themoviedb.org/t/p/w220_and_h330_face/wAkpPm3wcHRqZl8XjUI3Y2chYq2.jpg",
  "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/wawP3mOUeRBrAtnbPwWK5eFaMdV.jpg",
  "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/iMmMxF6f2OonUrXrHKBLSYAhXly.jpg"
];

const sectionList = [Section1(), Section2(), Section3()];

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: 'Downloads',
            )),
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: sectionList.length,
          itemBuilder: (context, index) {
            return sectionList[index];
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 30,
            );
          },
        ));
  }
}

Transform downloadsImage(Size size, {required margin, required image, angle}) {
  return Transform.rotate(
    angle: (angle ?? 0) * pi / 180,
    child: Container(
      clipBehavior: Clip.hardEdge,
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image:
              DecorationImage(fit: BoxFit.cover, image: NetworkImage(image))),
      width: size.width * 0.4,
      height: size.width * 0.58,
    ),
  );
}
