import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:movieapp/features/watch/data/Service/movie_watch_service.dart';
import 'package:movieapp/features/watch/domin/repos/movie_watch_repo.dart';

import '../../../../common/helper/mapper/TrailerMapper.dart';
import '../../../../common/helper/mapper/movie.dart';
import '../../../../core/models/trailer.dart';
import '../../../home/data/models/MovieModel.dart';

class WatchRepoImpl extends MovieWatchRepo {
  final MovieWatchService moviewatchService;

  WatchRepoImpl({required this.moviewatchService});

  @override
  Future<Either<dynamic, dynamic>> getWatchMovieTrailer(int movieId) async {
    var result = await moviewatchService.getWatchMovie(movieId);
    return result.fold(
      (l) => Left(l),
      (data) {
        var movies =
            TrailerMapper.toEntity(TrailerModel.fromJson(data['trailer']));
        print(
            "$movies  $movieId    ___________SSSSSSSSFFFFFFFFFFFFFFFFFFFFFFAAAAAAAA");

        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    var result = await moviewatchService.getRecommendationMovies(movieId);
    return result.fold(
      (l) => Left(l),
      (data) {
        var movies = List.from(data['content'])
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    var result = await moviewatchService.getSimilarMovies(movieId);
    return result.fold(
      (l) => Left(l),
      (data) {
        var movies = List.from(data['content'])
            .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
            .toList();
        return Right(movies);
      },
    );
  }
}
