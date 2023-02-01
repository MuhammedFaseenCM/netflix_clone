import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/Core/Failures/main_failure.dart';
import 'package:netflix_clone/domain/new_and_hot/Model/new_and_hot_resp.dart';
import 'package:netflix_clone/domain/new_and_hot/Repo/i_new_and_hot_repo.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  INewAndHotRepo iNewAndHotRepo;

  HomeBloc(this.iNewAndHotRepo) : super(HomeState.initial()) {
    // [on event GetHomeData ]
    on<GetHomeData>((event, emit) async {
      ///send loading to [UI]
      ///
      emit(state.copyWith(isLoading: true, isError: false));

      ///get data
      final movieResult = await iNewAndHotRepo.getNewAndHotMovieData();
      final tvresult = await iNewAndHotRepo.getNewAndHotTVData();

      ///transform [data]

      final state1 = movieResult.fold(
        (MainFailure failure) {
          return  HomeState(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
              pastYearMovieList: [],
              trendingMovieList: [],
              tensedramasMovieList: [],
              southIndianMovieList: [],
              trendingTVList: [],
              isLoading: false,
              isError: true);
        },
        (NewAndHotResp resp) {
          final pastYear = resp.results;
          final trending = resp.results;
          final dramas = resp.results;
          final southIndian = resp.results;
          pastYear.shuffle();
          trending.shuffle();
          dramas.shuffle();
          southIndian.shuffle();
          return HomeState(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear,
            trendingMovieList: trending,
            tensedramasMovieList: dramas,
            southIndianMovieList: southIndian,
            trendingTVList: state.trendingTVList,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(state1);

      /// tredning [tV List]
      final state2 = tvresult.fold((MainFailure failure) {
        return  HomeState(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tensedramasMovieList: [],
            southIndianMovieList: [],
            trendingTVList: [],
            isLoading: false,
            isError: true);
      }, (NewAndHotResp resp) {
        final top10List = resp.results;
        return HomeState(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: state.pastYearMovieList,
          trendingMovieList: state.trendingMovieList,
          tensedramasMovieList: state.tensedramasMovieList,
          southIndianMovieList: state.southIndianMovieList,
          trendingTVList: top10List,
          isLoading: false,
          isError: false,
        );
      });

      /// sending [UI]
      emit(state2);
    });
  }
}
