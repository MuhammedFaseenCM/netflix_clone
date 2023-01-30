import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';
import 'package:netflix_clone/Presentation/home/widgets/title_and_card_widget.dart';
import 'package:netflix_clone/Presentation/home/widgets/top_bgimage.dart';

ValueNotifier<bool> scrollnotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollnotifier,
      builder: (context, value, child) =>
          NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          if (direction == ScrollDirection.reverse) {
            scrollnotifier.value = true;
          } else if (direction == ScrollDirection.forward) {
            scrollnotifier.value = false;
          }

          return true;
        },
        child: Stack(
          children: [
            ListView(
              children: const [
                TopBGImageandWidgets(),
                TitleandCardWidget(
                    title: "Released in the past year", image: theLastOfus),
                TitleandCardWidget(
                  image: wednesdayPic,
                  title: "Latest & Hot",
                ),
                TitleandCardWidget(
                  image: theLastOfus,
                  title: "Top 10 TV shows in india today",
                  numbercard: true,
                ),
                TitleandCardWidget(title: "Tense Dramas", image: wednesdayPic),
                TitleandCardWidget(
                    title: "South indian cinema", image: theLastOfus),
                TitleandCardWidget(
                  image: wednesdayPic,
                  title: "Latest & Hot",
                )
              ],
            ),
            scrollnotifier.value
                ? const SizedBox()
                : AnimatedContainer(
                    duration: const Duration(seconds: 14),
                    width: double.infinity,
                    height: 80,
                    color: backgroundcolor.withOpacity(0.5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.network(
                              netflixLogo,
                              width: 50,
                              height: 50,
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.cast,
                                  color: whiteColor,
                                )),
                            kWidth,
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.cast,
                                  color: whiteColor,
                                )),
                            kWidth
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("TV shows", style: kTextStyle),
                            Text("Movies", style: kTextStyle),
                            Text("Catagories", style: kTextStyle)
                          ],
                        )
                      ],
                    ),
                  )
          ],
        ),
      ),
    ));
  }
}
