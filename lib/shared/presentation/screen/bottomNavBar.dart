import 'package:flutter/material.dart';
import 'package:frontend/shared/presentation/screen/chatPage.dart';
import 'package:frontend/shared/presentation/screen/mainHome.dart';

class RoutinesPage extends StatelessWidget {
  const RoutinesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Routines Page'));
  }
}

class SocialPage extends StatelessWidget {
  const SocialPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Social Page'));
  }
}

// Tu widget principal con navegación
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  // Lista de páginas que se renderizan según el índice
  final List<Widget> _pages = const [
    MainHomeView(),
    RoutinesPage(),
    SocialPage(),
    ChatPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // cambia la pantalla mostrada
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black, width: 0.5)),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withOpacity(0.5),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
          items: [
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration:
                    _selectedIndex == 0
                        ? BoxDecoration(
                          color: Colors.black.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(16),
                        )
                        : null,
                child: const Icon(Icons.home),
              ),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.construction),
              label: 'Routines',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new),
              label: 'Social',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
          ],
        ),
      ),
    );
  }
}
