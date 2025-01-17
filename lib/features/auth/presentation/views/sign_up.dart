import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/features/auth/presentation/views/widget/sign_in_view_body.dart';
import 'package:movieapp/features/auth/presentation/views/widget/sign_up_view_body.dart';
import '../../../../core/Service/servier_locter.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1A21),
      body: SignUpViewBody(),
    );
  }
}
