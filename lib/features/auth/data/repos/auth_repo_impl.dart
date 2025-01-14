import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movieapp/core/Service/auth_api_service/auth_api_service.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/features/auth/data/models/user_model.dart';

import '../../../../core/Service/shared_prefrence_singelton.dart';
import '../../../../core/constants/api_url.dart';
import '../../../../core/network/dio_client.dart';
import '../../domin/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  Future<Either> signup(UserModel user) async {
    var result = await getIt<AuthApiService>().signup(user);
    return result.fold((user) {
      Prefs.setString('token', user['user']['token']);

      return Right(user);
    }, (l) {
      return Left(l);
    });
  }



  @override
  Future<Either<String, UserModel>> signin(UserModel user) async {
    try {
      print("Sending request to: ${ApiUrl.signin} with data: ${user.userToMap()}");
      var response = await getIt<DioClient>().post(
        ApiUrl.signin,
        data: user.userToMap(),
      );
      print("Response received: ${response.data}");

      if (response.data != null && response.data['user'] != null) {
        print("UserModel created successfully");
        return Right(UserModel.fromJson(response.data['user']));
      } else {
        print("Invalid response structure");
        return Left('Invalid response structure');
      }
    } on DioException catch (e) {
      print("Error occurred: ${e.response?.data}");
      return Left(e.response?.data['message'] ?? 'An unknown error occurred');
    }
  }


  @override
  Future<bool> isLoggedIn() async {
    var token = Prefs.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }



}
