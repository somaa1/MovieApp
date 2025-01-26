import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/core/constants/api_url.dart';
import 'package:movieapp/core/network/dio_client.dart';

abstract class TvService {
  Future<Either> getPopularTv();
}

class TvApiServiceImpl extends TvService {
  Future<Either<String, dynamic>> getPopularTv() async {
    try {
      var response = await getIt<DioClient>().get(
        ApiUrl.popularTV,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'An error occurred');
    }
  }
  
}
