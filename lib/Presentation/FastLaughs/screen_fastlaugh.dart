import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/Presentation/FastLaughs/widget/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                    10,
                    (index) => VideoListItem(
                          index: index,
                        )))));
  }
}
