import 'package:flutter/material.dart';
import 'package:frontend/di.dart';
import 'package:frontend/shared/presentation/screen/homeScreen.dart';

void main() async {
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: Center(child: HomeScreen())));
  }
}
