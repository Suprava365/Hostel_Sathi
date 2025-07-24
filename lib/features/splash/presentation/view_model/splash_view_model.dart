import 'package:flutter/material.dart';
import 'package:hostel_sathi/features/splash/domain/use_case/NextPageNavigate.dart';

class SplashViewModel extends ChangeNotifier {
  final NextPageNavigateUseCase useCase;

  SplashViewModel(this.useCase);

  void navigateToNextScreen(BuildContext context) {
    useCase.waitAndNavigate((route) {
      Navigator.pushReplacementNamed(context, route);
    });
  }
}
