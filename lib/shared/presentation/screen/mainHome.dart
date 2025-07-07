import 'package:flutter/material.dart';
import 'package:frontend/features/Exercises/presentation/screen/ListExercise.dart';
import 'package:frontend/shared/presentation/screen/chatPage.dart';
import 'package:frontend/shared/presentation/screen/progressBar.dart';
import 'package:frontend/shared/presentation/screen/routinesScreen.dart';
import 'package:frontend/shared/presentation/theme/app_colors.dart';
// importá tus vistas directamente si están en archivos separados
// import 'package:frontend/features/Exercises/presentation/exercise_view.dart';

class _MainHomeViewState extends State<MainHomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget? _selectedView;

  // 👇 Nuevo: índice del ítem seleccionado en la barra inferior
  int _selectedIndex = 0;

  final List<Widget> _views = [
    Center(child: MyRoutinesPage()),
    Center(child: Text("Vista Crear Rutina")),
    Center(child: ProgressPage()),
    Center(child: ChatPage()),
  ];

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

  // 👇 Nuevo: función para manejar taps en la BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedView = Scaffold(body: _views[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                ? _selectedView
                : Column(
                  children: [
                    Expanded(
                      child: _buildExpandedButton(
                        "lib/assets/images/w1.jpg",
                        "Mis rutinas",
                        Scaffold(body: Center(child: MyRoutinesPage())),
                      ),
                    ),
                    Expanded(
                      child: _buildExpandedButton(
                        "lib/assets/images/w2.jpg",
                        "Crear rutina",
                        Scaffold(
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
                          body: Center(child: Text("Vista Marcas")),
                        ),
                      ),
                    ),
                  ],
                ),
      ),

      // 👇 Aquí va tu barra de navegación inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF3CBC18),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Routines'),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome),
            label: 'Generate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Shop',
          ),
        ],
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

class MainHomeView extends StatefulWidget {
  const MainHomeView({Key? key}) : super(key: key);

  @override
  _MainHomeViewState createState() => _MainHomeViewState();
}
