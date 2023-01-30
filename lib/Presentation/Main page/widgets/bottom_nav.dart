import 'package:flutter/material.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';

ValueNotifier<int> indexChangedNotifier = ValueNotifier(0);

class BottomNavWidgets extends StatelessWidget {
  const BottomNavWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangedNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: newIndex,
            onTap: (index) {
              indexChangedNotifier.value = index;
            },
            selectedItemColor: whiteColor,
            unselectedItemColor: greyColor,
            selectedIconTheme: const IconThemeData(color: whiteColor),
            unselectedIconTheme: const IconThemeData(color: whiteColor),
            backgroundColor: backgroundcolor,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.collections), label: ' New&Hot'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions), label: 'Fast Laughs'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download), label: 'Downloads')
            ]);
      },
    );
  }
}
