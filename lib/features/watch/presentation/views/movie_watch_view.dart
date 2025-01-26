import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/features/watch/presentation/views/widget/watch_view_body.dart';

import '../../../../common/widgets/appbar/app_bar.dart';
import '../../../home/domin/entites/movie_entity.dart';
import '../cubit/trailer_cubit.dart';

class MovieWatchView extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchView({super.key, required this.movieEntity});

  static const routeName = 'movie_watch_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerCubit()..getMovieTrailer(movieEntity.id!),
      child: Scaffold(
        appBar: BasicAppbar(
          hideBack: false,

        ),
        body: MovieWatchViewBody(movieEntity: movieEntity),
      ),
    );
  }
}
