import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/cubit/generic_data_cubit.dart';
import 'package:movieapp/common/cubit/generic_data_state.dart';
import 'package:movieapp/common/widgets/tv/tv_card.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/features/home/domin/entites/movie_entity.dart';
import 'package:movieapp/features/home/domin/entites/tv_entity.dart';
import 'package:movieapp/features/watch/domin/usecase/usecase_movie/get_recommendation_movies_use_case.dart';

import '../../../../../common/widgets/movie/movie_card.dart';
import '../../../domin/usecase/usecase_tv/get_recommendation_tv_use_case.dart';

class RecommendationTv extends StatelessWidget {
  final int id;

  const RecommendationTv({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    // توفير GenericDataCubit أعلى BlocBuilder
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<TvEntity>>(getIt<GetRecommendationTvUseCase>(),
            params: id),
      // تأكد من استدعاء الدالة التي تحمل البيانات
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is DataLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Recommendation',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return TvCard(
                          tvEntity: state.data[index],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemCount: state.data.length),
                ),
              ],
            );
          }

          if (state is FailureLoadData) {
            return Text(state.errorMessage);
          }

          return Container();
        },
      ),
    );
  }
}
