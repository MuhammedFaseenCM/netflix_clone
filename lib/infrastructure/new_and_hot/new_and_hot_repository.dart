import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/api_end_points.dart';
import 'package:netflix_clone/domain/new_and_hot/Model/new_and_hot_resp.dart';
import 'package:netflix_clone/Core/Failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/new_and_hot/Repo/i_new_and_hot_repo.dart';


@LazySingleton(as:INewAndHotRepo)
class NewAndHotRepository with INewAndHotRepo{
  @override
  Future<Either<MainFailure, NewAndHotResp>> getNewAndHotMovieData() async{
  try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewMovie);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadsList = 
           NewAndHotResp.fromJson(response.data);
      

        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, NewAndHotResp>> getNewAndHotTVData()async {
   try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewTV);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final downloadsList =  NewAndHotResp.fromJson(response.data);
       

        return Right(downloadsList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioError catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

}