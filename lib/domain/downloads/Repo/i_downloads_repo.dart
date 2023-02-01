import 'package:dartz/dartz.dart';
import 'package:netflix_clone/Core/Failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/Models/downloads_model.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImage();
}
