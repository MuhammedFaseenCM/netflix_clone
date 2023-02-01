import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/Core/Colors/colors.dart';
import 'package:netflix_clone/Core/Colors/constants.dart';
import 'package:netflix_clone/Core/Colors/strings.dart';
import 'package:netflix_clone/Presentation/NewAndHot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/Presentation/NewAndHot/widgets/everyones_watching_widget.dart';
import 'package:netflix_clone/application/new_and_hot/new_and_hot_bloc.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: AppBar(
                title: Text(
                  "New & Hot",
                  style: appBartextStyle,
                ),
                actions: [
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
                bottom: TabBar(
                  isScrollable: true,
                  labelColor: backgroundcolor,
                  labelStyle: kTextStyle,
                  unselectedLabelColor: whiteColor,
                  unselectedLabelStyle: kTextStyle,
                  tabs: const [
                    Tab(child: Text("🍿Coming soon")),
                    Tab(child: Text("👀Everyone's watching"))
                  ],
                  indicator: BoxDecoration(
                      color: whiteColor, borderRadius: customRadius),
                ),
              )),
          body: const TabBarView(children: [
            BuildComingSoon(),
            BuildEveryonesWatching(),
          ])),
    );
  }
}

class BuildComingSoon extends StatelessWidget {
  const BuildComingSoon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NewAndHotBloc>(context).add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<NewAndHotBloc>(context)
            .add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<NewAndHotBloc, NewAndHotState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return const Center(
                child: Text("Error while loading comingsoon list"));
          } else if (state.comingsoonList.isEmpty) {
            return const Center(child: Text("Comingsoon list is empty"));
          }
          return ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            itemCount: state.comingsoonList.length,
            itemBuilder: (context, index) {
              final movie = state.comingsoonList[index];

              if (movie.id == null) {
                return const SizedBox();
              }
              final date = DateTime.parse(movie.releaseDate!);
              final formattedDate = DateFormat.yMMMd('en_US').format(date);
              final monthNdate = formattedDate.split(",").first;
              final month = monthNdate.split(" ").first.toUpperCase();
              final day = monthNdate.split(" ").last;

              return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: month,
                  day: day,
                  posterpath:
                      '$imageAppendUrl${movie.backdropPath}' ?? 'No title',
                  movieName: movie.title ?? 'No title',
                  description: movie.overview ?? 'No description');
            },
            shrinkWrap: true,
          );
        },
      ),
    );
  }
}

class BuildEveryonesWatching extends StatelessWidget {
  const BuildEveryonesWatching({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NewAndHotBloc>(context)
          .add(const LoadDataInEveryonesWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<NewAndHotBloc>(context)
            .add(const LoadDataInEveryonesWatching());
      },
      child:
          BlocBuilder<NewAndHotBloc, NewAndHotState>(builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.isError) {
          return const Center(
              child: Text("Error while loading Everyone's watching list"));
        } else if (state.comingsoonList.isEmpty) {
          return const Center(child: Text("Everyone's watching list is empty"));
        }

        return ListView.builder(
          itemBuilder: (context, index) {
            final tv = state.everyOnesWatchingList[index];
            return EveryonesWatchingWidget(
              title: tv.originalName ?? 'No title',
              description: tv.overview ?? 'No overview',
              posterPath: '$imageAppendUrl${tv.backdropPath}' ?? '',
              id: tv.id.toString(),
            );
          },
        );
      }),
    );
  }
}
