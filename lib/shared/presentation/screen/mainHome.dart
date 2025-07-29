import 'package:flutter/material.dart';
import 'package:frontend/shared/presentation/entities/user_provider.dart';
import 'package:frontend/shared/presentation/screen/bottomNavBar.dart';
import 'package:frontend/shared/presentation/theme/app_colors.dart';
import 'package:provider/provider.dart';

class MainHomeView extends StatelessWidget {
  const MainHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 16),

              // Saludo
              const Text(
                "Good Morning 🔥",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Text(
                user != null ? "${user.firstName} ${user.lastName}" : "User",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // Buscador
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // My Routines
              _sectionTitle("My Routines"),
              const SizedBox(height: 12),
              _workoutSlider(),

              const SizedBox(height: 24),

              // Today Plan
              _sectionTitle("Today Plan"),
              const SizedBox(height: 12),
              _exerciseCard(
                "Push Up",
                "100 Push-up a day",
                "Intermediate",
                "lib/assets/images/w1.jpg",
                1.0,
              ),
              _exerciseCard(
                "Sit Up",
                "20 Sit-up a day",
                "Beginner",
                "lib/assets/images/w1.jpg",
                0.7,
              ),
              _exerciseCard(
                "Knee Push Up",
                "20/day",
                "Beginner",
                "lib/assets/images/w1.jpg",
                0.3,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _workoutSlider() {
    return SizedBox(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _workoutCard(
            "Lower Body Training",
            "500 Kcal",
            "50 Min",
            "lib/assets/images/w1.jpg",
          ),
          _workoutCard(
            "Handstand",
            "600 Kcal",
            "40 Min",
            "lib/assets/images/w2.jpg",
          ),
        ],
      ),
    );
  }

  Widget _workoutCard(String title, String kcal, String time, String image) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    _infoTag(Icons.local_fire_department, kcal),
                    const SizedBox(width: 8),
                    _infoTag(Icons.timer, time),
                  ],
                ),
              ],
            ),
          ),
          const Positioned(
            top: 8,
            right: 8,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.play_arrow, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTag(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 14),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _exerciseCard(
    String title,
    String subtitle,
    String level,
    String imagePath,
    double progress,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[300],
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(level, style: const TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
