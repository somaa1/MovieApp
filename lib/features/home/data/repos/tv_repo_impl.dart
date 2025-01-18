import 'package:dartz/dartz.dart';
import 'package:movieapp/common/helper/mapper/movie.dart';
import 'package:movieapp/common/helper/mapper/tvMapper.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/features/home/data/Service/movie_service.dart';
import 'package:movieapp/features/home/data/models/MovieModel.dart';
import 'package:movieapp/features/home/data/models/TvModel.dart';

import '../../domin/repos/movie_repo.dart';
import '../../domin/repos/tv_repo.dart';
import '../Service/tv_service.dart';

class TvRepoImpl extends TvRepo {
 final TvService tvService;


  TvRepoImpl({required this.tvService});
  Future<Either> getPopularTv() async {
    var result = await tvService.getPopularTv();
    return result.fold(
      (l) => Left(l),
      (data) {
        var tv = List.from(data['content']).map(
          (item) => TvMapper.toEntity(TvModel.fromJson(item)),
        ).toList();
        return Right(tv);
      },
    );
  }


}
