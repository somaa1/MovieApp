import 'package:flutter/material.dart';

import '../../../../../core/assets/app_images.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
 //   executeNavigation(); //فنكشن بتاخر وبتودي على بوردينج
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
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
    );
  }
  //
  // void executeNavigation() async {
  //  // bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
  //   await Future.delayed(Duration(seconds: 2));
  //   if (isOnBoardingViewSeen) {
  //     var islLoggedIn = FirebaseAuthService().isLoggedIn();
  //     if (islLoggedIn) {
  //       await Navigator.pushReplacementNamed(context, MainView.routeName);
  //     } else {
  //       await Navigator.pushReplacementNamed(context, SigninView.routeName);
  //     }
  //   } else {
  //     await Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
  //   }
  // }
}
