import 'package:flutter/material.dart';
import 'package:frontend/features/User/domain/use_cases/signInUser.dart';
import 'package:frontend/features/User/presentation/screen/registerView.dart';
import 'package:frontend/shared/presentation/bloc/NavigationService.dart';
import 'package:frontend/shared/presentation/screen/mainHome.dart';
import 'package:frontend/shared/presentation/theme/app_colors.dart';
import 'package:frontend/shared/presentation/widgets/buttonHome.dart';
import 'package:get_it/get_it.dart';

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
          const SizedBox(height: 30),
          ButtonHome(
            text: "Login",
            onPressed: () async {
              // Validación de campos vacíos
              if (_usernameController.text.isEmpty ||
                  _passwordController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Por favor, completa todos los campos"),
                  ),
                );
                return; // Detener la ejecución
              }

              setState(() => _isLoading = true);

              // Llamada al caso de uso
              final result = await _signInUserUseCase(
                _usernameController.text,
                _passwordController.text,
              );

              setState(() => _isLoading = false);

              result.fold(
                (failure) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Error de inicio de sesión: ${failure.toString()}",
                    ),
                  ),
                ),
                (user) =>
                    NavigationService.navigateTo(context, const MainHomeView()),
              );
            },
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
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
