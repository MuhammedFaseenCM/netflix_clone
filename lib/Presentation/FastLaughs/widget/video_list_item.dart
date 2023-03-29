
import 'package:flutter/material.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';
import 'package:netflix_clone/Core/Colors/strings.dart';
import 'package:netflix_clone/Presentation/Widgets/button_widget.dart';
import 'package:netflix_clone/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_clone/domain/downloads/Models/downloads_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget(
      {super.key, required this.widget, required this.movieData})
      : super(child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    return Stack(
      children: [
        FastLaughtVideoPlayer(
            onStateChanged: (isPlaying) {},
            videoUrl: videoUrl[index % videoUrl.length]),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Left side

                volumeButton(),

                //Right side

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage('$imageAppendUrl$posterPath'),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedVideosIdsNotifier,
                      builder:
                          (BuildContext context, Set<int> newLikedListIds, _) {
                        final idIndex = index;
                        if (newLikedListIds.contains(idIndex)) {
                          return GestureDetector(
                            onTap: () {
                              likedVideosIdsNotifier.value.remove(idIndex);
                              likedVideosIdsNotifier.notifyListeners();
                            },
                            child: VideoActionsWidget(
                                icon: Icons.emoji_emotions,
                                title: 'LOL',
                                color: whiteColor),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              likedVideosIdsNotifier.value.add(idIndex);
                              likedVideosIdsNotifier.notifyListeners();
                            },
                            child: VideoActionsWidget(
                              icon: Icons.emoji_emotions,
                              title: 'LOL',
                              color: redColor,
                            ),
                          );
                        }
                      },
                    ),
                    VideoActionsWidget(icon: Icons.add, title: 'My list'),
                    GestureDetector(
                        onTap: () {
                          final movieName = videoUrl[index];

                          Share.share("Here is the video link\n$movieName");
                        },
                        child: VideoActionsWidget(
                            icon: Icons.share, title: 'Share')),
                    VideoActionsWidget(icon: Icons.play_circle, title: 'Play')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  Color color;
  VideoActionsWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.color = whiteColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 30,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 16, color: color),
        ),
        kHeight
      ],
    );
  }
}

class FastLaughtVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const FastLaughtVideoPlayer(
      {super.key, required this.videoUrl, required this.onStateChanged});

  @override
  State<FastLaughtVideoPlayer> createState() => _FastLaughtVideoPlayerState();
}

class _FastLaughtVideoPlayerState extends State<FastLaughtVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.videoUrl);
    _controller.initialize().then((_) {
      setState(() {});
    });
    _controller.play();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _controller.value.isInitialized
          ? VideoPlayer(_controller)
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }
}
