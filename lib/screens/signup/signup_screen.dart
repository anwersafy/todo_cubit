import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/forms/sign_up_form/sign_up_form.dart';
import '../signin/signin_screen.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D2D5E),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 12,
                ),
                Lottie.asset("assets/todo.json",
                    height: 200),
                const SizedBox(
                  height: 12,
                ),
                const SignUpForm(),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        Future.delayed(const Duration(milliseconds: 200))
                            .then((value) => Navigator.pop(context));
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
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                      label: const Text("Sign In",
                          style: TextStyle(color: Colors.white)),
                      icon: const Icon(Icons.person, color: Colors.white),
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
