import 'dart:async';
import 'package:hostel_sathi/app/service_locator/service_locator.dart';
import 'package:hostel_sathi/core/network/hive_service.dart';

class NextPageNavigateUseCase {
  Future<void> waitAndNavigate(Function(String route) navigateCallback) async {
    await Future.delayed(const Duration(seconds: 2));

    final hiveService = serviceLocator<HiveService>();
    final loggedInEmail = await hiveService.getLoggedInUserEmail();

    if (loggedInEmail != null && loggedInEmail.isNotEmpty) {
      navigateCallback('/home');
    } else {
      navigateCallback('/login');
    }
  }
}
