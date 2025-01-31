import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/cubit/generic_data_cubit.dart';
import 'package:movieapp/features/search/presentation/bloc/selected_option.dart';

import '../../cubit/search_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          context.read<SearchCubit>().search(
                value,
                context.read<SelectOptionCubit>().state,
              );
        }
      },
      decoration: InputDecoration(hintText: 'Search...'),
    );
  }
}
