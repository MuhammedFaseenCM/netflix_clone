import 'package:flutter/cupertino.dart';

import 'package:netflix_clone/Core/Colors/constants.dart';
import 'package:netflix_clone/Presentation/Search/widgets/search_title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchTextTitle(title: "Movies & TV"),
        kHeight,
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
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
      ],
    );
  }
}

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              fit: BoxFit.cover, image: AssetImage(dogPic))),
    );
  }
}
