import 'package:bloc/bloc.dart';

enum SearchType { movie,tv }
class SelectOptionCubit extends Cubit<SearchType> {
  SelectOptionCubit():super(SearchType.movie);
  void selectMovie() => emit(SearchType.movie);
  void selectTv() => emit(SearchType.tv);

}