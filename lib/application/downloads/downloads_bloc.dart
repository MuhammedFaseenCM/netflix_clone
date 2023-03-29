import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_clone/Core/Failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/Models/downloads_model.dart';
import 'package:netflix_clone/domain/downloads/Repo/i_downloads_repo.dart';
part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo downloadsRepo;
  DownloadsBloc(this.downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImage>((event, emit) async {
      emit(state.copyWith(isLoading: true, downloadsFailureorSucess: none()));

      final downloadsOption =
          await downloadsRepo.getDownloadsImage();

      emit(downloadsOption.fold(
          (failure) => state.copyWith(
                isLoading: false,
                downloadsFailureorSucess: Some(
                  Left(failure),
                ),
              ),
          (success) => state.copyWith(
              isLoading: false,
              downloads: success,
              downloadsFailureorSucess: some(Right(success)))));
    });
  }
}
