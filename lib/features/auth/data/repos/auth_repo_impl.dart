import 'package:dartz/dartz.dart';
import 'package:movieapp/core/Service/servier_locter.dart';

import 'package:movieapp/features/auth/data/models/user_model.dart';
import 'package:movieapp/features/auth/domin/repos/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/Service/auth_api_service/auth_api_service.dart';

class AuthRepoImpl extends AuthRepo {



  @override
  Future<Either> signup(UserModel params) async {
    var data = await sl<AuthService>().signup(params);
    return data.fold(
            (error) {
          return Left(error);
        },
            (data) async {
          final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString('token',data['user']['token']);
          return Right(data);
        }
    );
  }

  @override
  Future<Either> signin(UserModel params) async {
    var data = await sl<AuthService>().signin(params);
    return data.fold(
            (error) {
          return Left(error);
        },
            (data) async {
          final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString('token',data['user']['token']);
          return Right(data);
        }
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    print('Token: $token'); // طباعة الـ token

    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

}