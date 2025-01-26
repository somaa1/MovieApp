import 'package:flutter/material.dart';
import 'package:movieapp/features/home/domin/entites/movie_entity.dart';
import 'package:movieapp/features/watch/presentation/views/widget/recommendation_movies.dart';
import 'package:movieapp/features/watch/presentation/views/widget/similar_movies.dart';
import 'package:movieapp/features/watch/presentation/views/widget/video_overview.dart';
import 'package:movieapp/features/watch/presentation/views/widget/video_player.dart';
import 'package:movieapp/features/watch/presentation/views/widget/video_release_date.dart';
import 'package:movieapp/features/watch/presentation/views/widget/video_vote_average.dart';

class MovieWatchViewBody extends StatelessWidget {
  final MovieEntity movieEntity;

  const MovieWatchViewBody({super.key, required this.movieEntity});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (movieEntity.id != null)
            VideoPlayer(id: movieEntity.id!)
          else
            const Center(
              child: Text('No video available'),
            ),
          const SizedBox(height: 16),
          Text(movieEntity.title ?? 'Unknown Title'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VideoReleaseDate(
                releaseDate: movieEntity.releaseDate ?? DateTime.now(),
              ),
              VideoVoteAverage(voteAverage: movieEntity.voteAverage ?? 0.0),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          VideoOverview(
            overview: movieEntity.overview!,
          ),
          const SizedBox(
            height: 16,
          ),
          if (movieEntity.id != null)
            RecommendationMovies(
              id: movieEntity.id!,
            ),
          const SizedBox(
            height: 18,
          ),
          if (movieEntity.id != null)
            SimilarMovies(
              id: movieEntity.id!,
            ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
