import 'package:flutter/material.dart';

import '../forgot_password/forgot_password_screen.dart';
import '../signin/signin_screen.dart';
import '../signup/signup_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        ForgotPasswordScreen(),
        SignUpScreen(),
        SignInScreen(),
      ],
    );
  }
}
