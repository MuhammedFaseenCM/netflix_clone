import 'package:dartz/dartz.dart';
import 'package:netflix_clone/Core/Failures/main_failure.dart';
import 'package:netflix_clone/domain/new_and_hot/Model/new_and_hot_resp.dart';


abstract class INewAndHotRepo {
  Future<Either<MainFailure, NewAndHotResp>> getNewAndHotMovieData();
  Future<Either<MainFailure, NewAndHotResp>> getNewAndHotTVData();
}