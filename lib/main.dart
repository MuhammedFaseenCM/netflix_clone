import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/Presentation/Main%20page/screen_main_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: backgroundcolor),
          scaffoldBackgroundColor: backgroundcolor,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: const TextTheme(
              bodyText1: TextStyle(color: whiteColor),
              bodyText2: TextStyle(color: whiteColor)),
          primarySwatch: Colors.blue,
          backgroundColor: backgroundcolor),
      home: const ScreenMainpage(),
    );
  }
}
