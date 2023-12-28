import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/screens/auth/auth_screen.dart';
import 'package:todo/screens/home/home_screen.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late StreamSubscription<User?> _sub;
  final _navigatorKey = GlobalKey<NavigatorState>();
  final _credential = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();

    _sub = FirebaseAuth.instance.userChanges().listen((event) {
      _navigatorKey.currentState!.pushReplacementNamed(
        event != null ? "home" : "login",
      );
    });
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      initialRoute: _credential == null ? "login" : "home",
      onGenerateRoute: (settings) {
        return switch (settings.name) {
          "home" => MaterialPageRoute(
              settings: settings,
              builder: (_) => const HomeScreen(),
            ),
          "login" => MaterialPageRoute(
              settings: settings,
              builder: (_) => const AuthScreen(),
            ),
          _ => MaterialPageRoute(
              settings: settings,
              builder: (_) => const AuthScreen(),
            )
        };
      },
    );
  }
}
