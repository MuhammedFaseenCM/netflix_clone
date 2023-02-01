import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/Core/Failures/main_failure.dart';
import 'package:netflix_clone/domain/new_and_hot/Model/new_and_hot_resp.dart';
import 'package:netflix_clone/domain/new_and_hot/Repo/i_new_and_hot_repo.dart';

part 'new_and_hot_event.dart';
part 'new_and_hot_state.dart';
part 'new_and_hot_bloc.freezed.dart';

@injectable
class NewAndHotBloc extends Bloc<NewAndHotEvent, NewAndHotState> {
  final INewAndHotRepo iNewAndHotRepo;
  NewAndHotBloc(this.iNewAndHotRepo) : super(NewAndHotState.initial()) {
    /*
Coming soon
    */
    on<LoadDataInComingSoon>((event, emit) async {
      //sending Loading indicator to UI
      emit(const NewAndHotState(
          comingsoonList: [],
          everyOnesWatchingList: [],
          isLoading: true,
          isError: false));

      ///Get data from server[Get data from serve]

      final result = await iNewAndHotRepo.getNewAndHotMovieData();
      final newstate = result.fold((MainFailure failure) {
        return const NewAndHotState(
            comingsoonList: [],
            everyOnesWatchingList: [],
            isLoading: false,
            isError: true);
      }, (NewAndHotResp resp) {
        return NewAndHotState(
            comingsoonList: resp.results,
            everyOnesWatchingList: state.everyOnesWatchingList,
            isLoading: false,
            isError: false);
      });
      emit(newstate);
    });

    /*
    EveryOne's watching
    */
    on<LoadDataInEveryonesWatching>((event, emit) async {
      final result = await iNewAndHotRepo.getNewAndHotTVData();
      final newstate = result.fold((MainFailure failure) {
        return const NewAndHotState(
            comingsoonList: [],
            everyOnesWatchingList: [],
            isLoading: false,
            isError: true);
      }, (NewAndHotResp resp) {
        return NewAndHotState(
            comingsoonList: state.comingsoonList,
            everyOnesWatchingList: resp.results,
            isLoading: false,
            isError: false);
      });
      emit(newstate);
    });
  }
}
