import 'package:flutter/material.dart';
import 'package:movieapp/features/home/domin/entites/movie_entity.dart';
import 'package:movieapp/features/home/domin/entites/tv_entity.dart';
import 'package:movieapp/features/watch/presentation/views/widget/recommendation_movies.dart';
import 'package:movieapp/features/watch/presentation/views/widget/recommendation_tv.dart';
import 'package:movieapp/features/watch/presentation/views/widget/similar_movies.dart';
import 'package:movieapp/features/watch/presentation/views/widget/similar_tv.dart';
import 'package:movieapp/features/watch/presentation/views/widget/video_overview.dart';
import 'package:movieapp/features/watch/presentation/views/widget/video_player.dart';
import 'package:movieapp/features/watch/presentation/views/widget/video_release_date.dart';
import 'package:movieapp/features/watch/presentation/views/widget/video_vote_average.dart';

class TvWatchViewBody extends StatelessWidget {
  final TvEntity tvEntity;

  const TvWatchViewBody({super.key, required this.tvEntity});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VideoPlayer(id: tvEntity.id!),
          const SizedBox(height: 16),
          Text(tvEntity.name ?? 'Unknown Title'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VideoReleaseDate(
                releaseDate: tvEntity.firstAirDate is DateTime
                    ? tvEntity.firstAirDate as DateTime
                    : DateTime.now(),
              ),
              VideoVoteAverage(voteAverage: tvEntity.voteAverage ?? 0.0),
            ],
          ),
          VideoOverview(
            overview: tvEntity.overview!,
          ),
          const SizedBox(height: 20),
          RecommendationTv(
            id: tvEntity.id!,
          ),
          const SizedBox(height: 20),
          SimilarTv(
            id: tvEntity.id!,
          ),
          Text('${tvEntity.voteAverage}')
        ],
      ),
    );
  }
}
