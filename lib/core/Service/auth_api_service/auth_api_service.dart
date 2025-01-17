import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/core/constants/api_url.dart';
import 'package:movieapp/core/network/dio_client.dart';
import 'package:movieapp/features/auth/data/models/user_model.dart';

import '../../errors/failure.dart';

abstract class AuthService {
  Future<Either> signup(UserModel user);

  Future<Either> signin(UserModel user);
}

class AuthApiServiceImpl extends AuthService {

  @override
  Future<Either> signup(UserModel params) async {
    try {
      var response = await sl<DioClient>()
          .post(ApiUrl.signup, data: params.userToMap());
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signin(UserModel params) async {
    try {
      var response = await sl<DioClient>()
          .post(ApiUrl.signin, data: params.userToMap());
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
