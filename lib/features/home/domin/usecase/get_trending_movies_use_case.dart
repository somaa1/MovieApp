import 'package:dartz/dartz.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/core/usecase/usecase.dart';
import 'package:movieapp/features/home/domin/repos/movie_repo.dart';


class GetTrendingMoviesUseCase extends UseCase<Either,dynamic>{

  @override
  Future<Either> call({params}) {
   return sl<MovieRepo>().getTrendingMovies();
  }

}