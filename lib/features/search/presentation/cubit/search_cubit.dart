import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/features/home/domin/entites/movie_entity.dart';
import 'package:movieapp/features/search/presentation/bloc/selected_option.dart';
import 'package:movieapp/features/watch/domin/usecase/usecase_movie/search_movies_use_case.dart';

import '../../../home/domin/entites/tv_entity.dart';
import '../../../watch/domin/usecase/usecase_tv/search_tv_use_case.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void search(String query, SearchType searchType) {
    emit(SearchLoading());
    switch (searchType) {
      case SearchType.movie:
        searchMovie(query);
      case SearchType.tv:
        searchTv(query);
        break;
    }
  }

  void searchMovie(
    String query,
  ) async {
    var result = await getIt<SearchMoviesUseCase>().call(params: query);
    result.fold(
      (error) {
        emit(SearchFailure(error: error));
      },
      (data) {
        emit(MoviesSearch(movies: data));
      },
    );
  }

  void searchTv(
    String query,
  ) async {
    var result = await getIt<SearchTvUseCase>().call(params: query);

    result.fold(
      (error) {
        emit(SearchFailure(error: error));
      },
      (data) {
        emit(TVsSearch(tvs: data));
      },
    );
  }
}
