import 'package:flutter/material.dart';
import 'package:hostel_sathi/app.dart';
import 'package:hostel_sathi/app/service_locator/service_locator.dart';
import 'package:hostel_sathi/core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  await HiveService().init();

  runApp(const MyApp());
}
