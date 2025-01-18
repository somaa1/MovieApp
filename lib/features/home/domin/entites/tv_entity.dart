
import '../../../../core/assets/app_images.dart';

class TvEntity {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  String? firstAirDate;
  String? name;
  double? voteAverage;
  int? voteCount;

  TvEntity(
      {required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originCountry,
        required this.originalLanguage,
        required this.originalName,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.firstAirDate,
        required this.name,
        required this.voteAverage,
        required this.voteCount});


  String providePosterPath() {
    return  posterPath != null ? AppImages.movieImageBasePath + posterPath! :
    AppImages.movieImageBasePath;
  }
}