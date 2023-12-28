import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/forms/forgot_password_form/forgot_password_form.dart';
import '../signup/signup_screen.dart';


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D2D5E),
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
                const ForgotPasswordForm(),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      label: const Text("Back",
                          style: TextStyle(color: Colors.white)),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                          minimumSize: const Size(12, 12),
                          foregroundColor: Colors.grey.shade900),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
                      },
                      label: const Text("Sign Up",
                          style: TextStyle(color: Colors.white)),
                      icon: const Icon(Icons.person_add, color: Colors.white),
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                          minimumSize: const Size(12, 12),
                          foregroundColor: Colors.grey.shade900),
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
