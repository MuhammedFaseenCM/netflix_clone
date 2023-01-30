import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';
import 'package:netflix_clone/Presentation/Search/search_result.dart';
import 'package:netflix_clone/Presentation/Search/widgets/search_idle.dart';
import 'package:netflix_clone/Presentation/Search/widgets/search_title.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopSearchWidget(),
            //const SearchTextTitle(title: 'Top Searches'),
            const SearchTextTitle(title: "Movies & TV"),
            kHeight20,
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1 / 1.4,
                shrinkWrap: true,
                children: List.generate(
                  20,
                  (index) {
                    return const MainCardWidget();
                    // MainCardWidget();
                  },
                ),
              ),
            ),
            // Expanded(
            //   child: ListView.separated(
            //       shrinkWrap: true,
            //       itemBuilder: (ctx, index) => const SearchIdleWidget(),
            //       separatorBu8lder: (ctx, index) => kHeight20,
            //       itemCount: 18),
            // )
          ],
        ),
      )),
    );
  }
}

class TopSearchWidget extends StatelessWidget {
  const TopSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CupertinoSearchTextField(
          backgroundColor: greyColor.withOpacity(0.5),
          prefixIcon: const Icon(
            CupertinoIcons.search,
            color: greyColor,
          ),
          suffixIcon: const Icon(
            CupertinoIcons.xmark_circle_fill,
            color: greyColor,
          ),
          style: const TextStyle(color: whiteColor),
        ),
      ],
    );
  }
}
