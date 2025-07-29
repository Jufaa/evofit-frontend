import 'package:flutter/material.dart';

class MyRoutinesPage extends StatelessWidget {
  const MyRoutinesPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          Container(
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFB9AFCB), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Routines",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Chip(label: Text("Calendar")),
                    SizedBox(width: 8),
                    Chip(label: Text("Cardio")),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Toggle Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ToggleButtons(
              isSelected: [true, false],
              onPressed: (index) {},
              selectedColor: Colors.white,
              fillColor: Color(0xFF002B0E),
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Me'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Share Routines'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // My routines title
          const Text(
            "My routines",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          // List of routines
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.fitness_center,
                      color: Color(0xFF154A1A),
                    ),
                    title: Text('Routine ${index + 1}'),
                    subtitle: Text('Routine example ${index + 1}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (i) => const Icon(
                              Icons.star,
                              color: Color(0xFF3CBC18),
                              size: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.favorite_border),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // View all routines button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xFF002B0E),
                side: const BorderSide(color: Color(0xFF3CBC18)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 32),
                child: Text("View 231 Routines"),
              ),
            ),
          ),
        ],
      ),

      // Bottom navigation bar
    );
  }
}
