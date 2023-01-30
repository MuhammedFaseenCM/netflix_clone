import 'package:flutter/material.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';
import 'package:netflix_clone/Presentation/NewAndHot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/Presentation/NewAndHot/widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: AppBar(
                title: Text(
                  "New & Hot",
                  style: appBartextStyle,
                ),
                actions: [
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
                bottom: TabBar(
                  isScrollable: true,
                  labelColor: backgroundcolor,
                  labelStyle: kTextStyle,
                  unselectedLabelColor: whiteColor,
                  unselectedLabelStyle: kTextStyle,
                  tabs: const [
                    Tab(child: Text("🍿Coming soon")),
                    Tab(child: Text("👀Everyone's watching"))
                  ],
                  indicator: BoxDecoration(
                      color: whiteColor, borderRadius: customRadius),
                ),
              )),
          body: TabBarView(
              children: [buildComingSoon(), buildEveryonesWatching()])),
    );
  }

  buildComingSoon() {
    return ListView(
      shrinkWrap: true,
      children: const [ComingSoonWidget(), ComingSoonWidget()],
    );
  }

  buildEveryonesWatching() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const EveryonesWatchingWidget();
      },
    );
  }
}


