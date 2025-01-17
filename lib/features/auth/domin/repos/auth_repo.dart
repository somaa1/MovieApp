import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:movieapp/features/auth/data/models/user_model.dart';

abstract class AuthRepo {

  
Future<Either> signup(UserModel user);
Future<Either> signin(UserModel user);
Future<bool> isLoggedIn();

}
