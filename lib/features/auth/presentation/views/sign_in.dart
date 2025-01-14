import 'package:flutter/material.dart';
import 'package:movieapp/features/auth/presentation/views/widget/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
static const routeName='signin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1A21),
      body: SignInViewBody(
      ),
    );
  }
}

