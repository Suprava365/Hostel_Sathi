import 'package:flutter/material.dart';
import 'package:hostel_sathi/features/splash/domain/use_case/NextPageNavigate.dart';
import 'package:hostel_sathi/features/splash/presentation/view_model/splash_view_model.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with SingleTickerProviderStateMixin {
  late SplashViewModel _viewModel;

  @override
  void initState() {
    super.initState();

    _viewModel = SplashViewModel(NextPageNavigateUseCase());

    // Trigger the navigation logic
    _viewModel.navigateToNextScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFFFA726)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Column(
              children: [
                Image.asset('assets/logo.png', width: 150),
                const SizedBox(height: 20),
                const Text(
                  "A Second Home Away From Home",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(bottom: 24.0),
              child: LinearProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
