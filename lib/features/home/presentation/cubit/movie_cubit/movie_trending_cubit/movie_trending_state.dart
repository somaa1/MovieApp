part of 'movie_trending_cubit.dart';

@immutable
sealed class MovieTrendingState {}

final class MovieTrendingInitial extends MovieTrendingState {}

final class MovieTrendingLoading extends MovieTrendingState {}

final class MovieTrendingSuccess extends MovieTrendingState {
  final List<MovieEntity> movies;

  MovieTrendingSuccess({required this.movies});
}

final class MovieTrendingFailure extends MovieTrendingState {
  final String message;

  MovieTrendingFailure({required this.message});
}
