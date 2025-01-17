import 'package:flutter/material.dart';
import 'package:movieapp/features/home/presentation/views/widget/trending.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'category_text.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryText(title: 'Trendings 🔥'),
          TrendingMovies(),
          SizedBox(height: 16),
          CategoryText(title: 'NowPlayingMovies '),
          // Add popular movies here
        ],
      ),
    );
  }
}
