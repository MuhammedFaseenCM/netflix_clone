import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';
import 'package:netflix_clone/Core/Colors/strings.dart';
import 'package:netflix_clone/Presentation/home/widgets/title_and_card_widget.dart';
import 'package:netflix_clone/Presentation/home/widgets/top_bgimage.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';

ValueNotifier<bool> scrollnotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollnotifier,
      builder: (context, value, child) =>
          NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          if (direction == ScrollDirection.reverse) {
            scrollnotifier.value = true;
          } else if (direction == ScrollDirection.forward) {
            scrollnotifier.value = false;
          }

          return true;
        },
        child: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  );
                } else if (state.isError) {
                  return const Center(
                    child: Text("Error while getting data"),
                  );
                }
                final releasedpastyear = state.pastYearMovieList.map((e) {
                  return "$imageAppendUrl${e.posterPath}";
                }).toList();
                final trendingMovieList = state.trendingMovieList.map((e) {
                  return "$imageAppendUrl${e.posterPath}";
                }).toList();
                final southIndianMovieList =
                    state.southIndianMovieList.map((e) {
                  return "$imageAppendUrl${e.posterPath}";
                }).toList();
                final tensedramasMovieList =
                    state.tensedramasMovieList.map((e) {
                  return "$imageAppendUrl${e.posterPath}";
                }).toList();
                final trendingTVList = state.trendingTVList.map((e) {
                  return "$imageAppendUrl${e.posterPath}";
                }).toList();
                southIndianMovieList.shuffle();
                tensedramasMovieList.shuffle();

                ///ListView
                return ListView(
                  children: [
                    const TopBGImageandWidgets(),
                    TitleandCardWidget(
                      title: "Released in the past year",
                      image: theLastOfus,
                      posterList: releasedpastyear.sublist(0, 10),
                    ),
                    TitleandCardWidget(
                      image: wednesdayPic,
                      title: "Latest & Hot",
                      posterList: trendingMovieList.sublist(11, 20),
                    ),
                    TitleandCardWidget(
                      image: theLastOfus,
                      title: "Top 10 TV shows in india today",
                      numbercard: true,
                      posterList: trendingTVList.sublist(0, 10),
                    ),
                    TitleandCardWidget(
                      title: "Tense Dramas",
                      image: wednesdayPic,
                      posterList: tensedramasMovieList,
                    ),
                    TitleandCardWidget(
                      title: "South indian cinema",
                      image: theLastOfus,
                      posterList: southIndianMovieList.sublist(11, 20),
                    ),
                  ],
                );
              },
            ),
            scrollnotifier.value
                ? const SizedBox()
                : AnimatedContainer(
                    duration: const Duration(seconds: 14),
                    width: double.infinity,
                    height: 80,
                    color: backgroundcolor.withOpacity(0.5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.network(
                              netflixLogo,
                              width: 50,
                              height: 50,
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.cast,
                                  color: whiteColor,
                                )),
                            kWidth,
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.cast,
                                  color: whiteColor,
                                )),
                            kWidth
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("TV shows", style: kTextStyle),
                            Text("Movies", style: kTextStyle),
                            Text("Catagories", style: kTextStyle)
                          ],
                        )
                      ],
                    ),
                  )
          ],
        ),
      ),
    ));
  }
}
