import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/helper/navigation/app_navigation.dart';
import 'package:movieapp/common/widgets/appbar/app_bar.dart';
import 'package:movieapp/features/auth/presentation/views/sign_in.dart';
import 'package:movieapp/features/home/presentation/views/home_view.dart';
import 'package:movieapp/features/search/presentation/bloc/selected_option.dart';
import 'package:movieapp/features/search/presentation/views/widget/search_content.dart';
import 'package:movieapp/features/search/presentation/views/widget/search_field.dart';
import 'package:movieapp/features/search/presentation/views/widget/selected_option.dart';
import 'package:movieapp/features/splash/presentation/cubit/splash_cubit.dart';

import '../../../../../core/assets/app_images.dart';
import '../../cubit/search_cubit.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SelectOptionCubit()),
        BlocProvider(create: (context) => SearchCubit())
      ],
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SearchField(),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<SelectOptionCubit, SearchType>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SelectedOption(
                      title: 'Movie',
                      isSelected: context.read<SelectOptionCubit>().state ==
                          SearchType.movie,
                      onTap: () =>
                          context.read<SelectOptionCubit>().selectMovie(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SelectedOption(
                      title: 'Tv',
                      isSelected: context.read<SelectOptionCubit>().state ==
                          SearchType.tv,
                      onTap: () => context.read<SelectOptionCubit>().selectTv(),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 16,),
            Expanded(child: SearchContent())
          ],
        ),
      ),
    );
  }
}
