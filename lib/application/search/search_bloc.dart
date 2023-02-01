import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/Core/Failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/Models/downloads_model.dart';
import 'package:netflix_clone/domain/downloads/Repo/i_downloads_repo.dart';
import 'package:netflix_clone/domain/search/Models/search_resp/search_resp.dart';
import 'package:netflix_clone/domain/search/Repo/i_search_repo.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo downloadsRepo;
  final ISearchRespo searchRepo;
  SearchBloc(this.downloadsRepo, this.searchRepo)
      : super(SearchState.initial()) {
    /*
    IDLE State
    */
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
            searchResultList: [],
            idleList: state.idleList,
            isLoading: false,
            isError: false));
        return;
      }
      emit(const SearchState(
          searchResultList: [], idleList: [], isLoading: true, isError: false));
      //get trending
      final result = await downloadsRepo.getDownloadsImage();
      final ustate = result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (List<Downloads> list) {
        return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false);
      });
      //show to ui
      emit(ustate);
    });
    /*
    search result State
    */
    on<SearchMovie>((event, emit) async {
      // call  search movie api
      final result =
          await searchRepo.searchMovies(movieQuery: event.movieQuery);

      final state = result.fold((MainFailure f) {
        return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true);
      }, (SearchResp r) {
        return SearchState(
            searchResultList: r.results,
            idleList: [],
            isLoading: false,
            isError: false);
      });

      //show to ui
      emit(state);
    });
  }
}
