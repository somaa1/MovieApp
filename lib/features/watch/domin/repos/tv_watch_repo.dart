import 'package:dartz/dartz.dart';

abstract class TvWatchRepo {
  Future<Either> getWatchTvTrailer(int tvId);
  Future<Either> getRecommendationTv(int tvId);
  Future<Either> getSimilarTv(int tvId);

}
