import 'package:dartz/dartz.dart';
import 'package:netflix_clone/Core/Failures/main_failure.dart';
import 'package:netflix_clone/domain/search/Models/search_resp/search_resp.dart';

abstract class ISearchRespo {
  Future<Either<MainFailure, SearchResp>> searchMovies(
      {required String movieQuery});
}
