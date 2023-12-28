import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/forms/sign_in_form/sign_in_form.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../signup/signup_screen.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D2D5E),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                Lottie.asset("assets/todo.json",
                    height: 240),
                const SizedBox(
                  height: 12,
                ),
                const SignInForm(),
                const SizedBox(
                  height: 12,
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ForgotPasswordScreen(),
                        ));
                  },
                  label: const Text("Forgot password",
                      style: TextStyle(color: Colors.white)),
                  icon: const Icon(Icons.email),
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      minimumSize: const Size(12, 12),
                      foregroundColor: Colors.white),
                ),
                Divider(
                  height: 24,
                  thickness: 1,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Don\'t have an account?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        )),

                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SignUpScreen(),
                            ));
                      },
                      label: const Text("Sign Up",
                          style: TextStyle(color: Colors.white)),
                      icon: const Icon(Icons.person_add),
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                          minimumSize: const Size(12, 12),
                          foregroundColor: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
