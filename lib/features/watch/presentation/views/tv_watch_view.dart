import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/features/home/domin/entites/tv_entity.dart';
import 'package:movieapp/features/watch/presentation/views/widget/tv_watch_view_body.dart';
import 'package:movieapp/features/watch/presentation/views/widget/watch_view_body.dart';

import '../../../../common/widgets/appbar/app_bar.dart';
import '../../../home/domin/entites/movie_entity.dart';
import '../cubit/trailer_cubit.dart';

class TvWatchView extends StatelessWidget {
  final TvEntity tvEntity;
  const TvWatchView({super.key, required this.tvEntity});

  static const routeName = 'tv_watch_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerCubit()..getTvTrailer(tvEntity.id!),
      child: Scaffold(
        appBar: const BasicAppbar(
          hideBack: false,
        ),
        body: TvWatchViewBody(tvEntity: tvEntity),
      ),
    );
  }
}
