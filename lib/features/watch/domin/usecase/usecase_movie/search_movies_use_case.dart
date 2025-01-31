import 'package:dartz/dartz.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/core/usecase/usecase.dart';
import 'package:movieapp/features/home/domin/repos/movie_repo.dart';
import 'package:movieapp/features/watch/domin/repos/movie_watch_repo.dart';

class SearchMoviesUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async{
    return  await getIt<MovieWatchRepo>().searchMovies(params!);
  }
}
