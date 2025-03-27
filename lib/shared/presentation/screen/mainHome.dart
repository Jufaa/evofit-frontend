import 'package:flutter/material.dart';
import 'package:frontend/shared/presentation/theme/app_colors.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _navigateTo(String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("FitnessApp", style: TextStyle(color: Colors.black)),
        backgroundColor: AppColors.second,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.second),
              child: Text(
                "Menú",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Inicio"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Configuración"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Cerrar sesión"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: AppColors.primary,
        child: Column(
          children: [
            Expanded(
              child: _buildExpandedButton(
                "lib/assets/images/w1.jpg",
                "Mis rutinas",
                "/workout",
              ),
            ),
            Expanded(
              child: _buildExpandedButton(
                "lib/assets/images/w2.jpg",
                "Crear rutina",
                "/nutrition",
              ),
            ),
            Expanded(
              child: _buildExpandedButton(
                "lib/assets/images/w1.jpg",
                "Ejercicios",
                "/wellness",
              ),
            ),
            Expanded(
              child: _buildExpandedButton(
                "lib/assets/images/w2.jpg",
                "Marcas",
                "/schedule",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedButton(String imagePath, String label, String route) {
    return GestureDetector(
      onTap: () => _navigateTo(route),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover, // Ajusta la imagen al tamaño del botón
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color:
                  Colors
                      .black54, // Fondo semitransparente para mejorar la visibilidad del texto
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
