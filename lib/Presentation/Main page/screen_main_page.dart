import 'package:flutter/material.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:netflix_clone/Presentation/FastLaughs/screen_fastlaugh.dart';
import 'package:netflix_clone/Presentation/Main%20page/widgets/bottom_nav.dart';
import 'package:netflix_clone/Presentation/NewAndHot/screen_newhot.dart';
import 'package:netflix_clone/Presentation/Search/Screen_search.dart';
import 'package:netflix_clone/Presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflix_clone/Presentation/home/screen_home.dart';

class ScreenMainpage extends StatelessWidget {
  const ScreenMainpage({super.key});

  final pages = const [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundcolor,
        body: ValueListenableBuilder(
          valueListenable: indexChangedNotifier,
          builder: (context, int updatedIndex, _) {
            return pages[updatedIndex];
          },
        ),
        bottomNavigationBar: BottomNavWidgets(),
      ),
    );
  }
}
