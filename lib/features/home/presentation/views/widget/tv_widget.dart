import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/widgets/tv/tv_card.dart';
import 'package:movieapp/features/home/domin/entites/tv_entity.dart';
import '../../../../../common/cubit/generic_data_cubit.dart';
import '../../../../../common/cubit/generic_data_state.dart';
import '../../../../../common/widgets/movie/movie_card.dart';
import '../../../../../core/Service/servier_locter.dart';
import '../../../domin/entites/movie_entity.dart';
import '../../../domin/usecase/get_now_playing_movies_use_case.dart';
import '../../../domin/usecase/get_tv_popular_movies_use_case.dart';

class TvPopularMovies extends StatelessWidget {
  const TvPopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GenericDataCubit()
          ..getData<List<TvEntity>>(getIt<GetPopularTvUseCase>()),
        child: BlocBuilder<GenericDataCubit, GenericDataState>(
          builder: (context, state) {
            if (state is DataLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is DataLoaded) {
              return SizedBox(
                height: 300,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return TvCard(
                        tvEntity: state.data[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                    itemCount: state.data.length),
              );
            }

            if (state is FailureLoadData) {
              return Center(child: Text(state.errorMessage));
            }

            return Container();
          },
        ));
  }
}
