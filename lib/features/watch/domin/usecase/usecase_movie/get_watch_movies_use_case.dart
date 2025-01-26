import 'package:dartz/dartz.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/core/usecase/usecase.dart';
import 'package:movieapp/features/home/domin/repos/movie_repo.dart';
import 'package:movieapp/features/watch/domin/repos/movie_watch_repo.dart';

class GetWatchMoviesUseCase extends UseCase<Either, int> {
  @override
  Future<Either> call({int? params}) {
    return getIt<MovieWatchRepo>().getWatchMovieTrailer(params!);
  }
}
