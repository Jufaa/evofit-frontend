import 'package:flutter/material.dart';
import 'package:frontend/features/User/domain/use_cases/createUser.dart';
import 'package:frontend/features/User/presentation/screen/loginView.dart';
import 'package:frontend/shared/presentation/bloc/NavigationService.dart';
import 'package:frontend/shared/presentation/screen/mainHome.dart';
import 'package:frontend/shared/presentation/theme/app_colors.dart';
import 'package:frontend/shared/presentation/widgets/buttonHome.dart';
import 'package:get_it/get_it.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

final CreateUserUseCase _createUserUseCase =
    GetIt.instance.get<CreateUserUseCase>();

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _birthdateController =
      TextEditingController(); // Nuevo controlador para birthdate

  bool _obscurePassword = true;
  bool _isLoading = false;

  // Función para mostrar el DatePicker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _birthdateController.text =
            "${picked.toLocal()}".split(' ')[0]; // Mostrar solo la fecha
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          Padding(
            padding: const EdgeInsets.only(top: 180.0),
            child: _buildRegisterContainer(),
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
                'Register',
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

  Widget _buildRegisterContainer() {
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
      child: ListView(
        children: [
          /// Inputs
          _buildInputField(
            controller: _usernameController,
            label: "Username",
            icon: Icons.person,
            isPassword: false,
          ),
          const SizedBox(height: 10),
          _buildInputField(
            controller: _emailController,
            label: "Email",
            icon: Icons.email,
            isPassword: false,
          ),
          const SizedBox(height: 10),
          _buildInputField(
            controller: _passwordController,
            label: "Password",
            icon: Icons.lock,
            isPassword: true,
          ),
          const SizedBox(height: 10),
          _buildInputField(
            controller: _confirmPasswordController,
            label: "Confirm Password",
            icon: Icons.lock,
            isPassword: true,
          ),
          const SizedBox(height: 10),
          _buildInputField(
            controller: _firstNameController,
            label: "First Name",
            icon: Icons.person,
            isPassword: false,
          ),
          const SizedBox(height: 10),
          _buildInputField(
            controller: _lastNameController,
            label: "Last Name",
            icon: Icons.person,
            isPassword: false,
          ),
          const SizedBox(height: 10),
          // Nuevo campo de fecha de nacimiento
          GestureDetector(
            onTap:
                () => _selectDate(
                  context,
                ), // Al tapear el campo se abrirá el DatePicker
            child: AbsorbPointer(
              // Previene la edición manual del campo de texto
              child: _buildInputField(
                controller: _birthdateController,
                label: "Birthdate",
                icon: Icons.calendar_today,
                isPassword: false,
              ),
            ),
          ),
          const SizedBox(height: 10),

          ButtonHome(
            text: "Register",
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
              if (_passwordController.text != _confirmPasswordController.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Las contraseñas no coinciden")),
                );
                return; // Detener la ejecución
              }

              final DateTime? birthdate =
                  _birthdateController.text.isNotEmpty
                      ? DateTime.tryParse(_birthdateController.text)
                      : null;

              if (birthdate == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Por favor, selecciona una fecha de nacimiento válida",
                    ),
                  ),
                );
                return;
              }

              final result = await _createUserUseCase(
                _emailController.text,
                _passwordController.text,
                _usernameController.text,
                _firstNameController.text,
                _lastNameController.text,
                birthdate,
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

          /// Sign Up Text
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
              );
            },
            child: const Text(
              "You have account? Sign in",
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
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
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 210, 210, 210),
          fontWeight: FontWeight.bold,
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.white,
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
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthdateController
        .dispose(); // Dispose del controlador de fecha de nacimiento

    super.dispose();
  }
}
