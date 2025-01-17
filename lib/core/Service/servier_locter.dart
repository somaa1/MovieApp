import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/core/Service/auth_api_service/auth_api_service.dart';
import 'package:movieapp/core/network/dio_client.dart';
import 'package:movieapp/features/auth/data/repos/auth_repo_impl.dart';
import 'package:movieapp/features/auth/domin/repos/auth_repo.dart';
import 'package:movieapp/features/auth/domin/usecase/islogin.dart';
import 'package:movieapp/features/auth/domin/usecase/signup.dart';
import 'package:movieapp/features/auth/domin/usecase/signin.dart';
import 'package:movieapp/features/home/data/Service/movie_service.dart';
import 'package:movieapp/features/home/domin/repos/movie_repo.dart';
import 'package:movieapp/features/home/domin/usecase/get_trending_movies_use_case.dart';

import '../../features/home/data/repos/movie_repo.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // DioClient

  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  if (!sl.isRegistered<MovieService>()) {
    sl.registerSingleton<MovieApiServiceImpl>(MovieApiServiceImpl());
    print('MovieService has been registered!');
  } else {
    print('MovieService is already registered.');
  }
  // Repostories
  sl.registerSingleton<AuthRepo>(AuthRepoImpl());
  sl.registerSingleton<MovieRepo>(MovieRepoImpl(movieService: sl<MovieApiServiceImpl>()));

  // Usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoginUseCase>(IsLoginUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
}
