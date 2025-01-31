import 'package:flutter/material.dart';
import 'package:movieapp/common/widgets/appbar/app_bar.dart';
import 'package:movieapp/features/search/presentation/views/widget/search_view_body.dart';
import 'package:movieapp/features/splash/presentation/views/widget/splash_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static const routeName = "search";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
        title: Text('Search'),
      ),
      body: SearchViewBody(),
    );
  }
}
