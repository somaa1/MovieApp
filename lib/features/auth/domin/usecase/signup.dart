import 'package:dartz/dartz.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/core/usecase/usecase.dart';
import 'package:movieapp/features/auth/data/models/user_model.dart';

import '../repos/auth_repo.dart';

class SignupUseCase extends UseCase<Either,UserModel>{
 
  @override
  Future<Either> call({UserModel? params}) {
   return sl<AuthRepo>().signup(params!);
  }

}