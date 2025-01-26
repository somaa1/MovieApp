import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/helper_functions/build_error_bar.dart';
import 'package:movieapp/features/watch/presentation/cubit/trailer_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatelessWidget {
  final int id;

  const VideoPlayer({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrailerCubit, TrailerState>(
      builder: (context, state) {
        if (state is TrailerInitial) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is TrailerLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is TrailerFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        if (state is TrailerSuccess) {
          return YoutubePlayer(
            controller: state.youtubePlayerController,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
            progressColors: const ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
          );
        }
        return Container(); // Replace with your VideoPlayer widget
      },
    );
  }
}
