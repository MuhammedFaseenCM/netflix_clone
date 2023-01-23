import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';

class ScreenMainpage extends StatelessWidget {
  const ScreenMainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
          child: Center(
        child: Text('Main page'),
      )),
    );
  }
}
