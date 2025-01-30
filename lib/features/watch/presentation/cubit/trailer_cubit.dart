import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/features/watch/domin/usecase/usecase_tv/get_watch_tv_use_case.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/entity/trailer.dart';
import '../../domin/usecase/usecase_movie/get_watch_movies_use_case.dart';

part 'trailer_state.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerInitial());

  void getMovieTrailer(int movieId) async {
    var result = await getIt<GetWatchMoviesUseCase>().call(params: movieId);
    emit(TrailerLoading());
    result.fold(
      (error) {
        emit(TrailerFailure(errorMessage: error));
      },
      (data) async {
        TrailerEntity trailerEntity = data;
        YoutubePlayerController _controller = YoutubePlayerController(
          initialVideoId: trailerEntity.key!,
          flags: YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
          ),
        );

        emit(TrailerSuccess(youtubePlayerController: _controller));
      },
    );
  }
  void getTvTrailer(int movieId) async {
    emit(TrailerLoading());

    var result = await getIt<GetWatchTvUseCase>().call(params: movieId);

    result.fold(
          (error) {
        emit(TrailerFailure(errorMessage: error));
      },
          (data) async {
        // Ensure `data` is a list of trailers
        if (data is List<TrailerEntity> && data.isNotEmpty) {
          // Use the first trailer in the list
          TrailerEntity trailerEntity = data.first;

          YoutubePlayerController _controller = YoutubePlayerController(
            initialVideoId: trailerEntity.key!,
            flags: YoutubePlayerFlags(
              autoPlay: false,
              mute: false,
            ),
          );

          emit(TrailerSuccess(youtubePlayerController: _controller));
        } else {
          emit(TrailerFailure(errorMessage: "No trailers found."));
        }
      },
    );
  }


}
