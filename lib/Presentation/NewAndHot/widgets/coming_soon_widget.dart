import 'package:flutter/material.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';
import 'package:netflix_clone/Presentation/Widgets/button_widget.dart';
import 'package:netflix_clone/Presentation/Widgets/video_widget.dart';
import 'package:netflix_clone/Presentation/home/widgets/top_bgimage.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          height: 500,
          child: Column(
            children: const [
              Text(
                "FEB",
                style: TextStyle(color: greyColor),
              ),
              Text(
                "11",
                style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 4.0,
                    fontWeight: FontWeight.w900),
              )
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Puss in Boots",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -5),
                    ),
                    Row(
                      children: [
                        threeButtonsWidget(
                            icon: Icons.notifications,
                            text: "Remind me",
                            color: whiteColor,
                            iconsize: 20.0,
                            fontsize: 12.0),
                        threeButtonsWidget(
                            icon: Icons.info,
                            text: "Info",
                            color: whiteColor,
                            iconsize: 20.0,
                            fontsize: 12.0)
                      ],
                    ),
                  ],
                ),
                const Text("Coming on Friday"),
                kHeight20,
                const Text(
                  "Puss in Boots",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Long before he even met Shrek, the notorious fighter, lover and outlaw Puss in Boots becomes a hero when he sets off on an adventure with the tough and sreet smart Kitty Softpaws and the mastermind Humpty Dumpty to save his town. This is the true story of The Cat, The Myth, The Legend...The Boots.",
                  style: TextStyle(color: greyColor),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
