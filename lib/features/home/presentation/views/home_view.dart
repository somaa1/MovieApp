import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/widgets/appbar/app_bar.dart';
import 'package:movieapp/features/auth/presentation/views/widget/sign_in_view_body.dart';
import 'package:movieapp/features/home/presentation/views/widget/home_view_body.dart';
import '../../../../core/Service/servier_locter.dart';
import '../../../../core/utils/app_text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BasicAppbar(
          hideBack: true,
          leading: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'Movie',
                  style: TextStyles.bold19.copyWith(color: Colors.white)),
              TextSpan(
                  text: ' App',
                  style: TextStyles.bold19.copyWith(color: Colors.red)),
            ])),
          ),
        ),
        backgroundColor: Color(0xFF1B1A21),
        body: HomeViewBody(),
      ),
    );
  }
}
