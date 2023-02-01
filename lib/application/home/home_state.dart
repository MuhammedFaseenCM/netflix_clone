part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState(
      {required String id,
      required List<HotAndNewData> pastYearMovieList,
      required List<HotAndNewData> trendingMovieList,
      required List<HotAndNewData> tensedramasMovieList,
      required List<HotAndNewData> southIndianMovieList,
      required List<HotAndNewData> trendingTVList,
      required bool isLoading,
      required bool isError}) = _Initial;

  factory HomeState.initial() => const HomeState(
    
      pastYearMovieList: [],
      trendingMovieList: [],
      tensedramasMovieList: [],
      southIndianMovieList: [],
      trendingTVList: [],
      isLoading: false,
      isError: false, id: '0');
}
