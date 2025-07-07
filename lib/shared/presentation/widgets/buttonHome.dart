import 'package:flutter/material.dart';
import 'package:frontend/shared/presentation/theme/app_colors.dart';

class ButtonHome extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonHome({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Ocupar todo el ancho disponible
      height: 50, // Altura fija como en la imagen
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero, // Evitar padding por defecto
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // Bordes redondeados
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25), // Bordes redondeados
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0), // Texto en blanco
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
