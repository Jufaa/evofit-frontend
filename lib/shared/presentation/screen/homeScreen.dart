// 1️⃣ HomeScreen (pantalla inicial con imagen y botones)
import 'package:flutter/material.dart';
import 'package:frontend/features/User/presentation/screen/loginView.dart';
import 'package:frontend/features/User/presentation/screen/registerView.dart';
import 'package:frontend/shared/presentation/bloc/NavigationService.dart';
import 'package:frontend/shared/presentation/widgets/buttonHome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PONER IMAGEN AQUI como fondo
          SizedBox.expand(
            child: Image.asset(
              'lib/assets/images/imagenLogin.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(color: Colors.black.withOpacity(0.5)),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Welcome to EvoFit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Join over 10,000 learners over the World and enjoy online education!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  ButtonHome(
                    text: 'Create an account',
                    onPressed:
                        () => NavigationService.navigateTo(
                          context,
                          const RegisterView(),
                        ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap:
                        () => NavigationService.navigateTo(
                          context,
                          const LoginView(),
                        ),
                    child: const Text(
                      'Already have an account? Log in',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 2️⃣ AuthOptionsView (pantalla de botones de redes para crear cuenta)
class AuthOptionsView extends StatelessWidget {
  const AuthOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create new account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Begin with creating new free account. This helps you keep your learning way easier.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed:
                  () => NavigationService.navigateTo(
                    context,
                    const RegisterView(),
                  ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3CBC18),
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text('Continue with email'),
            ),
            const SizedBox(height: 24),
            const Center(child: Text('or')),
            const SizedBox(height: 24),
            _socialButton(icon: Icons.apple, text: 'Continue with Apple'),
            _socialButton(icon: Icons.facebook, text: 'Continue with Facebook'),
            _socialButton(
              icon: Icons.g_mobiledata,
              text: 'Continue with Google',
            ),
            const Spacer(),
            const Text.rich(
              TextSpan(
                text: 'By using Classroom, you agree to the ',
                children: [
                  TextSpan(
                    text: 'Terms and Privacy Policy.',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ],
              ),
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialButton({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 20),
        label: Text(text),
        style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
      ),
    );
  }
}
