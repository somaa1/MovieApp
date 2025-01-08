import 'package:dio/dio.dart';
import '../errors/failure.dart';

class ApiService {
  final Dio dio;

  // تعريف ثابت لمفتاح API
  static const String _apiKey = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwZWNiYzc4YThiMDg0YWMyY2NjMzFmZGFjMjUwNmRkMyIsInN1YiI6IjY3NzAxNThkN2QxYmM4N2RlNzYxNTE5YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nT0Yx6TGRSVHiKeG6P0xiX8qiBB1kw2w1NRm48uNY_Y';

  ApiService({Dio? dio})
      : dio = dio ??
      Dio(BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
      ));

  // طريقة GET
  Future<dynamic> getRequest(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      final response = await dio.get(endpoint, queryParameters: params);
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    }
  }

  // طريقة POST
  Future<dynamic> postRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.post(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    }
  }

  // طريقة DELETE
  Future<dynamic> deleteRequest(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      final response = await dio.delete(endpoint, queryParameters: params);
      return response.data;
    } on DioException catch (e) {
      throw ServerFailure.fromDiorError(e);
    }
  }
}
