import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';
import 'package:netflix_clone/Core/Colors/strings.dart';
import 'package:netflix_clone/Presentation/downloads/screen_downloads.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });

    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: whiteColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
            style: TextStyle(color: greyColor, fontSize: 15),
            textAlign: TextAlign.center,
            'We will download a personalised selection of\nmovies and shows for you, So there is\nalways something to watch on your\ndevice'),
        BlocBuilder<DownloadsBloc, DownloadsState>(builder: (context, state) {
          if (state.isLoading ||
              state.downloads!.isEmpty ||
              state.downloads == null) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return SizedBox(
            width: size.width,
            height: size.width,
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: greyColor[800],
                        radius: size.width * 0.38,
                      ),
                      downloadsImage(size,
                          image:
                              '$imageAppendUrl${state.downloads![0].posterPath}',
                          margin: const EdgeInsets.only(left: 180.0),
                          angle: 20),
                      downloadsImage(size,
                          image:
                              "$imageAppendUrl${state.downloads![1].posterPath}",
                          margin: const EdgeInsets.only(right: 180.0),
                          angle: -20),
                      downloadsImage(size,
                          image:
                              "$imageAppendUrl${state.downloads![2].posterPath}",
                          margin: const EdgeInsets.only(top: 50.0)),
                    ],
                  ),
          );
        }),
      ],
    );
  }
}
