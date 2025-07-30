import 'package:flutter/material.dart';
import 'package:frontend/features/User/domain/use_cases/signInUser.dart';
import 'package:frontend/features/User/presentation/screen/registerView.dart';
import 'package:frontend/shared/presentation/bloc/NavigationService.dart';
import 'package:frontend/shared/presentation/entities/user_provider.dart';
import 'package:frontend/shared/presentation/screen/bottomNavBar.dart';
import 'package:frontend/shared/presentation/screen/mainHome.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

final SignInUserUseCase _signInUserUseCase =
    GetIt.instance.get<SignInUserUseCase>();

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool isPassword,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? _obscurePassword : false,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        suffixIcon:
            isPassword
                ? IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                )
                : null,
        labelStyle: const TextStyle(color: Colors.black87),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.green, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.green, width: 1),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      cursorColor: Colors.green,
    );
  }

  Future<void> _handleLogin() async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor, completa todos los campos")),
      );
      return;
    }

    setState(() => _isLoading = true);

    print("🟡 Iniciando login...");
    final result = await _signInUserUseCase(
      _usernameController.text,
      _passwordController.text,
    );
    print("🟢 Resultado del login: $result");

    setState(() => _isLoading = false);

    result.fold(
      (failure) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error de inicio de sesión: $failure")),
      ),
      (user) {
        print("✅ Usuario logueado: $user");
        Provider.of<UserProvider>(context, listen: false).setUser(user);
        NavigationService.navigateTo(context, const BottomNavBar());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 16),
              const Text(
                'Log into account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Welcome back!\nLet’s continue learning',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 32),
              _buildInputField(
                controller: _usernameController,
                label: "Username",
                icon: Icons.email,
                isPassword: false,
              ),
              const SizedBox(height: 20),
              _buildInputField(
                controller: _passwordController,
                label: "Password",
                icon: Icons.lock,
                isPassword: true,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child:
                    _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Login"),
              ),
              const SizedBox(height: 24),
              const Center(child: Text("or")),
              const SizedBox(height: 24),
              // Aquí tus botones sociales si quieres
              // ...
              const SizedBox(height: 24),
              Center(
                child: GestureDetector(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const RegisterView()),
                      ),
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text.rich(
                  TextSpan(
                    text: 'By using Classroom, you agree to the\n',
                    children: [
                      TextSpan(
                        text: 'Terms ',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      TextSpan(text: 'and '),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
