import 'package:flutter/material.dart';
import 'package:hostel_sathi/view/home_screen.dart';
import 'package:hostel_sathi/view/login_screen.dart';
import 'package:hostel_sathi/view/register_screen.dart';
import 'package:hostel_sathi/view/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hostel Sathi",
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
