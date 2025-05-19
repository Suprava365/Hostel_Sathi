import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to login screen after 2 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFFFA726)], // white to orange
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
                Image.asset(
                  'assets/logo.png', // Replace with your asset path
                  width: 150,
                ),
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
