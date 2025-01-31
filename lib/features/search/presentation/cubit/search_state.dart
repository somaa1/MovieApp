part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}

class MoviesSearch extends SearchState {
  final List<MovieEntity> movies;
  MoviesSearch({required this.movies});
}

class TVsSearch extends SearchState {
  final List<TvEntity> tvs;
  TVsSearch({required this.tvs});
}
final class SearchFailure extends SearchState {
  final String error;

  SearchFailure({required this.error});
}
