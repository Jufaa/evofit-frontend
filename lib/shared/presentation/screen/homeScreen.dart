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
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonHome(
              text: "Login",
              onPressed:
                  () =>
                      NavigationService.navigateTo(context, const LoginView()),
            ),
            SizedBox(height: 16),
            ButtonHome(
              text: "Register",
              onPressed:
                  () => NavigationService.navigateTo(
                    context,
                    const RegisterView(),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
