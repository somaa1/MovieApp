import 'package:dartz/dartz.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/core/usecase/usecase.dart';
import 'package:movieapp/features/home/domin/repos/movie_repo.dart';
import 'package:movieapp/features/watch/domin/repos/movie_watch_repo.dart';
import 'package:movieapp/features/watch/domin/repos/tv_watch_repo.dart';

class SearchTvUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async{
    return  await getIt<TvWatchRepo>().SearchTv(params!);
  }
}
