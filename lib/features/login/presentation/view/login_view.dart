import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostel_sathi/app/service_locator/service_locator.dart';
import 'package:hostel_sathi/core/network/hive_service.dart';
import 'package:hostel_sathi/features/login/presentation/view_model/login_event.dart';
import 'package:hostel_sathi/features/login/presentation/view_model/login_state.dart';
import 'package:hostel_sathi/features/login/presentation/view_model/login_view_model.dart';
import 'package:hostel_sathi/features/home/presentation/view/home_screen.dart';

class LoginViewClean extends StatefulWidget {
  const LoginViewClean({super.key});

  @override
  State<LoginViewClean> createState() => _LoginViewCleanState();
}

class _LoginViewCleanState extends State<LoginViewClean> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _handleLogin() {
    context.read<LoginViewModel>().add(
      CheckLoginEvent(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginState>(
      listener: (context, state) async {
        if (state.isSuccess && state.loginMatched == true) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Login successful!")));
          await serviceLocator<HiveService>().saveLoggedInUserEmail(
            _emailController.text.trim(),
          );
          await Future.delayed(const Duration(milliseconds: 600));
          if (context.mounted) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        } else if (state.isSuccess && state.loginMatched == false) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Invalid credentials")));
        } else if (state.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'An error occurred')),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 40),

                /// Email
                const Text(
                  "E-mail",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                /// Password
                const Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed:
                          () => setState(
                            () => _obscurePassword = !_obscurePassword,
                          ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                /// Login Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Login successful!")),
                      );

                      await Future.delayed(const Duration(milliseconds: 800));

                      if (context.mounted) {
                        Navigator.pushReplacementNamed(context, '/dashboard');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFA726),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: const Text("Login", style: TextStyle(fontSize: 16)),
                  ),
                ),

                const SizedBox(height: 32),

                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                    child: const Text(
                      "Don't have an account? Register now",
                      style: TextStyle(
                        color: Color(0xFFFFA726),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
