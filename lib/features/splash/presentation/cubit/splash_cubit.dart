
import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/features/auth/domin/usecase/islogin.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void startApp() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await sl<IsLoginUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
