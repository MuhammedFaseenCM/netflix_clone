part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  factory SearchEvent.initialize() = Initialize;
  const factory SearchEvent.searchMovie({required String movieQuery}) =
      SearchMovie;
}
