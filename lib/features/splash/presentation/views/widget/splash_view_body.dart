import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/helper/navigation/app_navigation.dart';
import 'package:movieapp/features/auth/presentation/views/sign_in.dart';
import 'package:movieapp/features/home/presentation/views/home_view.dart';
import 'package:movieapp/features/splash/presentation/cubit/splash_cubit.dart';

import '../../../../../core/assets/app_images.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if(state is Authenticated){
AppNavigator.pushReplacementNamed(context, HomeView.routeName);
        }
        if(state is UnAuthenticated){
          AppNavigator.pushReplacementNamed(context, SignInView.routeName);

        }
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImages.splashImage,
            fit: BoxFit.cover, // This ensures the image covers the entire area
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xff1A1B20).withOpacity(0),
                      const Color(0xff1A1B20)
                    ]
                )
            ),
          )
        ],
      ),
    );
  }
}
