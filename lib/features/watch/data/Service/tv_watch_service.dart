import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/core/constants/api_url.dart';
import 'package:movieapp/core/network/dio_client.dart';

abstract class TvWatchService {
  Future<Either> getWatchTv(int movieId);

  Future<Either> getRecommendationTv(int movieId);

  Future<Either> getSimilarTv(int movieId);
}

class TvWatchApiServiceImpl extends TvWatchService {
  @override
  Future<Either> getRecommendationTv(int tvId) async {
    try {
      var response =
          await getIt<DioClient>().get("${ApiUrl.tv}/$tvId/recommendations");
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either> getWatchTv(int movieId) async {
    try {
      var response =
          await getIt<DioClient>().get("${ApiUrl.tv}/$movieId/trailers");
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either> getSimilarTv(int tvId) async {
    try {
      var response =
          await getIt<DioClient>().get("${ApiUrl.tv}/$tvId/similar");
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.message);
    }
  }
}
