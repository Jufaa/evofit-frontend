import 'package:flutter/material.dart';
import 'package:frontend/features/Exercises/presentation/screen/ListExercise.dart';
import 'package:frontend/shared/presentation/theme/app_colors.dart';
// importá tus vistas directamente si están en archivos separados
// import 'package:frontend/features/Exercises/presentation/exercise_view.dart';

class MainHomeView extends StatefulWidget {
  const MainHomeView({super.key});

  @override
  State<MainHomeView> createState() => _MainHomeViewState();
}

class _MainHomeViewState extends State<MainHomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget? _selectedView;

  void _showView(Widget view) {
    setState(() {
      _selectedView = view;
    });
  }

  void _goBackToMenu() {
    setState(() {
      _selectedView = null;
    });
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
              onTap: _goBackToMenu,
            ),
          ],
        ),
      ),
      body: Container(
        color: AppColors.primary,
        child:
            _selectedView != null
                ? Column(
                  children: [
                    Expanded(child: _selectedView!),
                    ElevatedButton(
                      onPressed: _goBackToMenu,
                      child: Text("Volver al menú"),
                    ),
                  ],
                )
                : Column(
                  children: [
                    Expanded(
                      child: _buildExpandedButton(
                        "lib/assets/images/w1.jpg",
                        "Mis rutinas",
                        const Scaffold(
                          body: Center(child: Text("Vista Crear Rutina")),
                        ),
                      ),
                    ),
                    Expanded(
                      child: _buildExpandedButton(
                        "lib/assets/images/w2.jpg",
                        "Crear rutina",
                        const Scaffold(
                          body: Center(child: Text("Vista Crear Rutina")),
                        ),
                      ),
                    ),
                    Expanded(
                      child: _buildExpandedButton(
                        "lib/assets/images/w1.jpg",
                        "Ejercicios",
                        Scaffold(body: Center(child: ListexerciseView())),
                      ),
                    ),
                    Expanded(
                      child: _buildExpandedButton(
                        "lib/assets/images/w2.jpg",
                        "Marcas",
                        const Scaffold(
                          body: Center(child: Text("Vista Crear Rutina")),
                        ),
                      ),
                    ),
                  ],
                ),
      ),
    );
  }

  Widget _buildExpandedButton(
    String imagePath,
    String label,
    Scaffold viewToShow,
  ) {
    return GestureDetector(
      onTap: () => _showView(viewToShow),
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
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black54,
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
