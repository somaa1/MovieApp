import 'package:flutter/material.dart';
import 'package:movieapp/features/home/domin/entites/tv_entity.dart';
import 'package:movieapp/features/watch/presentation/views/tv_watch_view.dart';

import '../../../core/configs/theme/app_colors.dart';
import '../../helper/navigation/app_navigation.dart';
import 'CircularProgressBar.dart';

class TvCard extends StatelessWidget {
  final TvEntity tvEntity;

  const TvCard({
    required this.tvEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, TvWatchView.routeName, tvEntity);
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  // الصورة الخلفية
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(tvEntity.providePosterPath()),
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                  ),
                  // Circular Progress Bar في الزاوية السفلية اليمنى
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: CircularProgressBar(voteCount: tvEntity.voteAverage!.toDouble() * 10 ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tvEntity.name!,
                      style: const TextStyle(
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber,
                        ),
                        Text(
                          ' ${tvEntity.voteAverage!.toStringAsFixed(1)}',
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
