import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/core/constants/api_url.dart';
import 'package:movieapp/core/network/dio_client.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
}

class MovieApiServiceImpl extends MovieService {


  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.trendingMovies,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
