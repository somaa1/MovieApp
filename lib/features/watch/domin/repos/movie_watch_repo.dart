import 'package:dartz/dartz.dart';

abstract class MovieWatchRepo {
  Future<Either> getWatchMovieTrailer(int movieId);
  Future<Either> getRecommendationMovies(int movieId);
  Future<Either> getSimilarMovies(int movieId);
}
