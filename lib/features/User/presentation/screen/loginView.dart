import 'package:flutter/material.dart';
import 'package:frontend/features/User/presentation/screen/registerView.dart';
import 'package:frontend/shared/presentation/bloc/NavigationService.dart';
import 'package:frontend/shared/presentation/screen/mainHome.dart';
import 'package:frontend/shared/presentation/theme/app_colors.dart';
import 'package:frontend/shared/presentation/widgets/buttonHome.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          Padding(
            padding: const EdgeInsets.only(top: 180.0),
            child: _buildLoginContainer(),
          ),
        ],
      ),
    );
  }

  /// Fondo con degradado
  Widget _buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.primary),
      child: Padding(
        padding: EdgeInsets.only(top: 60.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                'Login',
                textAlign: TextAlign.center,

                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginContainer() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.second,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        children: [
          /// Inputs
          _buildInputField(
            controller: _emailController,
            label: "Email",
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
          const SizedBox(height: 30),
          ButtonHome(
            text: "Login",
            onPressed:
                () =>
                    NavigationService.navigateTo(context, const MainHomeView()),
          ),
          const SizedBox(height: 30),
          Text(
            'Forgot password?',
            textAlign: TextAlign.center,

            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          /// Sign Up Text
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterView()),
              );
            },
            child: const Text(
              "Don't have an account? Sign Up",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool isPassword,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? _obscurePassword : false,
      style: const TextStyle(
        color: Colors.white,
      ), // Asegura que el texto también sea blanco
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 210, 210, 210),
          fontWeight: FontWeight.bold,
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.white, // Cuando el input está en foco
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: Icon(icon, color: Colors.white),
        suffixIcon:
            isPassword
                ? IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                )
                : null,

        // 🛑 Bordes blancos en todos los estados
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
