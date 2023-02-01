part of 'new_and_hot_bloc.dart';

@freezed
class NewAndHotState with _$NewAndHotState {
  const factory NewAndHotState({
    required List<HotAndNewData> comingsoonList,
    required List<HotAndNewData> everyOnesWatchingList,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory NewAndHotState.initial() =>
      const NewAndHotState(comingsoonList: [], everyOnesWatchingList: [], isError: false, isLoading: false,);
}
