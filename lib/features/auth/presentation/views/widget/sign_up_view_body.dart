import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/core/Service/servier_locter.dart';
import 'package:movieapp/core/configs/theme/app_colors.dart';
import 'package:movieapp/features/auth/data/models/user_model.dart';
import 'package:movieapp/features/auth/domin/usecase/signup.dart';
import 'package:movieapp/features/auth/presentation/views/sign_in.dart';
import 'package:reactive_button/reactive_button.dart';

import '../../../../../common/helper/navigation/app_navigation.dart';
import '../../../../../core/helper_functions/build_error_bar.dart';
import '../../../../../core/helper_functions/build_success_bar.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../home/presentation/views/home_view.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});

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
          Text(
            'Sign Up',
            style: TextStyles.bold24,
          ),
          const SizedBox(height: 20),
          buildTextField(hintText: 'Email', controller: _email),
          const SizedBox(height: 20),
          buildTextField(hintText: 'Password', controller: _password),
          const SizedBox(height: 50),
          ReactiveButton(
            title: 'Sign Up',
            activeColor: AppColors.primary,
            onSuccess: () {
AppNavigator.pushAndRemove(context, HomeView.routeName);
            },
            onFailure: (String error) {
              buildErrorBar(context, error);
            },
            onPressed: () async {
              final signupUseCase = sl<SignupUseCase>();
             await signupUseCase.call(
                params: UserModel(email: _email.text, password: _password.text),
              );

            },
          ),
          const SizedBox(height: 20),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "Do you have account ? ",
                ),
                TextSpan(
                  text: 'Sign In',
                  style: TextStyles.regular16.copyWith(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      AppNavigator.pushReplacementNamed(
                          context, SignInView.routeName);
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
