import 'package:dartz/dartz.dart';
import 'package:movieapp/common/helper/mapper/movie.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/features/home/data/Service/movie_service.dart';
import 'package:movieapp/features/home/data/models/MovieModel.dart';

import '../../domin/repos/movie_repo.dart';

class MovieRepoImpl extends MovieRepo {
final MovieService movieService;

  MovieRepoImpl({required this.movieService});
  @override
  Future<Either> getTrendingMovies() async {
    final result = await movieService.getTrendingMovies();
    return result.fold(
      (error) {
        return Left(error);
      },
      (data) {

        var movie = List.from(data['content'])
            .map((item) => (MovieMapper.toEntity(MovieModel.fromJson(item))))
            .toList();
        print('Trending Movies Data: $movie'); // طباعة البيانات المستلمة

        return Right(movie);
      },
    );
  }
}
