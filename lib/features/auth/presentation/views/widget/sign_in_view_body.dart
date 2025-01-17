import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/common/helper/navigation/app_navigation.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/core/configs/theme/app_colors.dart';
import 'package:movieapp/core/helper_functions/build_error_bar.dart';
import 'package:movieapp/core/helper_functions/build_success_bar.dart';
import 'package:movieapp/features/auth/data/models/user_model.dart';
import 'package:movieapp/features/auth/domin/usecase/signin.dart';
import 'package:movieapp/features/auth/presentation/views/sign_up.dart';
import 'package:movieapp/features/home/presentation/views/home_view.dart';
import 'package:reactive_button/reactive_button.dart';

import '../../../../../core/utils/app_text_styles.dart';

class SignInViewBody extends StatelessWidget {
  SignInViewBody({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 50, right: 16, left: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Sign In',
            style: TextStyles.bold24,
          ),
          const SizedBox(height: 20),
          buildTextField(hintText: 'Email', controller: _email),
          const SizedBox(height: 20),
          buildTextField(hintText: 'Password', controller: _password),
          const SizedBox(height: 50),
          ReactiveButton(
            title: 'Sign In',
            activeColor: AppColors.primary,
            onSuccess: () {},
            onFailure: (String error) {},
            onPressed: () async {
              final signinUseCase = sl<SigninUseCase>();
              final result = await signinUseCase.call(
                params: UserModel(email: _email.text, password: _password.text),
              );
              result.fold(
                    (failure) {
                  // فشل تسجيل الدخول
                  buildErrorBar(context, failure.toString());
                },
                    (success) {
                  // نجاح تسجيل الدخول
                  buildSuccessBar(context, 'Login successful');
                  AppNavigator.pushReplacementNamed(context, HomeView.routeName);
                },
              );

            },
          ),
          const SizedBox(height: 20),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: "Don't have account ? ",
                ),
                TextSpan(
                  text: 'Sign Up',
                  style: TextStyles.regular16.copyWith(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      AppNavigator.pushReplacementNamed(
                          context, SignUpView.routeName);
                    },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  TextField buildTextField(
      {required String hintText, TextEditingController? controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
