
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/Models/downloads_model.dart';
import 'package:netflix_clone/domain/downloads/Repo/i_downloads_repo.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final videoUrl = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://www.instagram.com/reel/CbwuqIwg7y1/?utm_source=ig_embed&utm_campaign=loading",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"
];

ValueNotifier<Set<int>> likedVideosIdsNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(IDownloadsRepo downloadsRepo)
      : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      //Loading shows in UI
      emit(const FastLaughState(
          videosList: [], isError: false, isLoading: true));
      //get trending movies
      final result = await downloadsRepo.getDownloadsImage();
      final statesresult = result.fold(
          (l) => const FastLaughState(
                videosList: [],
                isLoading: false,
                isError: true,
              ),
          (resp) => FastLaughState(
                videosList: resp,
                isError: false,
                isLoading: false,
              ));
      //send to ui

      emit(statesresult);
    });
    on<LikeVideo>((event, emit) {
      likedVideosIdsNotifier.value.add(event.id);
      likedVideosIdsNotifier.notifyListeners();
    });

    on<UnlikeVideo>((event, emit) {
      likedVideosIdsNotifier.value.remove(event.id);
      likedVideosIdsNotifier.notifyListeners();
    });
  }
}
