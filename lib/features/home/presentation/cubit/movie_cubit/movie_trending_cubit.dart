
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:movieapp/features/home/domin/entites/movie_entity.dart';
import 'package:movieapp/features/home/domin/usecase/get_trending_movies_use_case.dart';

part 'movie_trending_state.dart';

class MovieTrendingCubit extends Cubit<MovieTrendingState> {
  MovieTrendingCubit(this.getTrendingMoviesUseCase) : super(MovieTrendingInitial());
final GetTrendingMoviesUseCase getTrendingMoviesUseCase;
  void fetchTrendingMovies() async {
    emit(MovieTrendingLoading());
    var result = await getTrendingMoviesUseCase.call();
    result.fold(
      (error) {
        emit(MovieTrendingFailure(message: error.message));
      },
      (data) {
        print(
            "Fetched trending movies: ${data.map((movie) => movie.title).toList()}");

        emit(MovieTrendingSuccess(movies: data));
      },
    );
  }
}
