import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/features/home/domin/usecase/get_trending_movies_use_case.dart';
import 'package:movieapp/features/home/presentation/cubit/movie_cubit/movie_trending_cubit.dart';

import '../../../../../core/assets/app_images.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MovieTrendingCubit(sl<GetTrendingMoviesUseCase>())
          ..fetchTrendingMovies(),
        child: BlocBuilder<MovieTrendingCubit, MovieTrendingState>(
          builder: (context, state) {
            if (state is MovieTrendingLoading) {
              return Column(
                children: [
                  Center(
                    child: const CircularProgressIndicator(),
                  ),
                ],
              );
            }

            if (state is MovieTrendingSuccess) {
              final screenHeight = MediaQuery.of(context).size.height;
              return FanCarouselImageSlider.sliderType1(
                imagesLink: state.movies
                    .map((item) =>
                        AppImages.movieImageBasePath +
                        item.posterPath.toString())
                    .toList(),
                isAssets: false,
                autoPlay: true,
                sliderHeight: screenHeight * 0.5,
                showIndicator: true,
              );
            }

            if (state is MovieTrendingFailure) {
              return Center(child: Text(state.message));
            }

            return Container();
          },
        ));
  }
}
