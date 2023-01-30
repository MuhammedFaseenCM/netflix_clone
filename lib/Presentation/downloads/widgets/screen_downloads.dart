import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';
import 'package:netflix_clone/Presentation/Widgets/app_bar_widget.dart';

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

class Section1 extends StatelessWidget {
  const Section1({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(
          Icons.settings,
          color: whiteColor,
        ),
        Text('Smart downloads')
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: whiteColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
            style: TextStyle(color: greyColor, fontSize: 16),
            textAlign: TextAlign.center,
            'We will download a personalised selection of\nmovies and shows for you, So there is\nalways something to watch on your\ndevice'),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: greyColor[800],
                radius: size.width * 0.38,
              ),
              downloadsImage(size,
                  image: imageList[1],
                  margin: const EdgeInsets.only(left: 180.0),
                  angle: 20),
              downloadsImage(size,
                  image: imageList[2],
                  margin: const EdgeInsets.only(right: 180.0),
                  angle: -20),
              downloadsImage(size,
                  image: imageList[0],
                  margin: const EdgeInsets.only(top: 50.0)),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: blueAccentcolor,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Setup",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: whiteColor),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: () {},
          color: whiteColor,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "See what you can download",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: backgroundcolor),
            ),
          ),
        )
      ],
    );
  }
}
