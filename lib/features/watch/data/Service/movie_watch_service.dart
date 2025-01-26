import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/core/constants/api_url.dart';
import 'package:movieapp/core/network/dio_client.dart';

abstract class MovieWatchService {
  Future<Either> getWatchMovie(int movieId);

  Future<Either> getRecommendationMovies(int movieId);

  Future<Either> getSimilarMovies(int movieId);

  Future<Either> getListsMovies(int movieId);
}

class WatchApiServiceImpl extends MovieWatchService {
  @override
  Future<Either> getWatchMovie(int movieId) async {
    try {
      var response =
          await getIt<DioClient>().get("${ApiUrl.movie}/$movieId/trailer");
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    try {
      var response = await getIt<DioClient>()
          .get("${ApiUrl.movie}/$movieId/recommendations");
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.message);
    }
  }


  @override
  Future<Either> getSimilarMovies(int movieId) async {
    try {
      var response = await getIt<DioClient>().get(
        '${ApiUrl.movie}$movieId/similar',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getListsMovies(int movieId) async {
    try {
      var response = await getIt<DioClient>().get(
        '${ApiUrl.movie}$movieId/lists',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']
      );
    }

  }
}
