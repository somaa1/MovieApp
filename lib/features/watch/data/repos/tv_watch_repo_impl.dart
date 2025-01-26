import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:movieapp/common/helper/mapper/tvMapper.dart';
import 'package:movieapp/features/home/data/Service/tv_service.dart';
import 'package:movieapp/features/home/data/models/TvModel.dart';
import 'package:movieapp/features/watch/data/Service/movie_watch_service.dart';
import 'package:movieapp/features/watch/data/Service/tv_watch_service.dart';
import 'package:movieapp/features/watch/domin/repos/movie_watch_repo.dart';

import '../../../../common/helper/mapper/TrailerMapper.dart';
import '../../../../common/helper/mapper/movie.dart';
import '../../../../core/models/trailer.dart';
import '../../../home/data/models/MovieModel.dart';
import '../../domin/repos/tv_watch_repo.dart';

class TvWatchRepoImpl extends TvWatchRepo {
  final TvWatchService tvWatchService;

  TvWatchRepoImpl({required this.tvWatchService});

  @override
  Future<Either> getRecommendationTv(int tvId) async {
    var result = await tvWatchService.getRecommendationTv(tvId);
    return result.fold(
      (l) => Left(l),
      (data) {
        var movies = List.from(data['content'])
            .map((item) => TvMapper.toEntity(TvModel.fromJson(item)))
            .toList();

        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getWatchTvTrailer(int tvId) async {
    var result = await tvWatchService.getWatchTv(tvId);
    return result.fold(
      (l) => Left(l),
      (data) {
        var movies = (data['trailers'] as List)
            .map((trailer) =>
                TrailerMapper.toEntity(TrailerModel.fromJson(trailer)))
            .toList();
        print("$movies  $tvId Tvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv  ");

        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getSimilarTv(int tvId)async {
    var result = await tvWatchService.getSimilarTv(tvId);
    return result.fold(
          (l) => Left(l),
          (data) {
        var movies = List.from(data['content'])
            .map((item) => TvMapper.toEntity(TvModel.fromJson(item)))
            .toList();

        return Right(movies);
      },
    );
  }
}
