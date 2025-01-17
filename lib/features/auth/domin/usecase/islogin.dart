import 'package:dartz/dartz.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/core/usecase/usecase.dart';
import 'package:movieapp/features/auth/data/models/user_model.dart';

import '../../../../core/errors/failure.dart';
import '../repos/auth_repo.dart';

class IsLoginUseCase extends UseCase<bool,dynamic>{

  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepo>().isLoggedIn();
  }

}