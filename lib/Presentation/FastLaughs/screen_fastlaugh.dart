import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/Presentation/FastLaughs/widget/video_list_item.dart';
import 'package:netflix_clone/application/fast_laugh/fast_laugh_bloc.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(body: SafeArea(
      child: BlocBuilder<FastLaughBloc, FastLaughState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
              ),
            );
          } else if (state.isError) {
            return const Center(
              child: Text("Error"),
            );
          } else if (state.videosList.isEmpty) {
            return const Center(
              child: Text("Video list is empty"),
            );
          } else {
            return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                    state.videosList.length,
                    (index) => VideoListItemInheritedWidget(
                          key: Key(index.toString()),
                          widget: VideoListItem(index: index),
                          movieData: state.videosList[index],
                        )));
          }
        },
      ),
    ));
  }
}
