import 'package:movieapp/features/home/data/models/TvModel.dart';
import 'package:movieapp/features/home/domin/entites/tv_entity.dart';

import '../../../features/home/data/models/MovieModel.dart';
import '../../../features/home/domin/entites/movie_entity.dart';

class TvMapper {

  static TvEntity toEntity(TvModel tv) {
    return TvEntity(adult: tv.adult,
        backdropPath: tv.backdropPath,
        genreIds: tv.genreIds,
        id: tv.id,
        originCountry: tv.originCountry,
        originalLanguage: tv.originalLanguage,
        originalName: tv.originalName,
        overview: tv.overview,
        popularity: tv.popularity,
        posterPath: tv.posterPath,
        firstAirDate: tv.firstAirDate,
        name: tv.name,
        voteAverage: tv.voteAverage,
        voteCount: tv.voteCount);
  }
}