import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostel_sathi/app/service_locator/service_locator.dart';
import 'package:hostel_sathi/features/about/presentation/view/about_page.dart';
import 'package:hostel_sathi/features/account/presentation/view/account_settings_page.dart';
import 'package:hostel_sathi/features/feedback/presentation/view/feedback_page.dart';
import 'package:hostel_sathi/features/issues/presentation/view/issues_page.dart';
import 'package:hostel_sathi/features/login/presentation/view/login_view.dart';
import 'package:hostel_sathi/features/login/presentation/view_model/login_view_model.dart';
import 'package:hostel_sathi/features/register/presentation/view/register_view.dart';
import 'package:hostel_sathi/features/register/presentation/view_model/register_view_model.dart';
import 'package:hostel_sathi/features/home/presentation/bottom_tabs/profile_section.dart';
import 'package:hostel_sathi/features/terms/presentation/view/terms_conditions_page.dart';
import 'package:hostel_sathi/features/home/presentation/bottom_tabs/trending_page.dart';
import 'package:hostel_sathi/features/home/presentation/view/home_screen.dart';
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
        '/': (context) => const HomeScreen(),
        '/home': (context) => const HomeScreen(),
        '/dashboard': (context) => HomeScreen(),

        '/register':
            (context) => BlocProvider.value(
              value: serviceLocator<RegisterViewModel>(),
              child: const RegisterView(),
            ),

        '/login':
            (context) => BlocProvider<LoginViewModel>(
              create: (_) => serviceLocator<LoginViewModel>(),
              child: const LoginViewClean(),
            ),

        // '/login':
        //     (context) => BlocProvider(
        //       create:
        //           (_) => LoginViewModel(checkLoginUsecase: serviceLocator()),
        //       child: const LoginViewClean(),
        //     ),
      },
    );
  }
}
