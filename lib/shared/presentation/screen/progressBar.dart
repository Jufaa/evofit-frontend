import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          Container(
            height: 180,
            width: double.infinity,
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
                  "Progress",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Chip(label: Text("Week")),
                    SizedBox(width: 8),
                    Chip(label: Text("Strength")),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Circular progress indicator
          CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 10.0,
            percent: 0.75,
            center: const Text(
              "75%",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            progressColor: Color(0xFF3CBC18),
            backgroundColor: Color(0xFFE5E5E5),
            circularStrokeCap: CircularStrokeCap.round,
          ),

          const SizedBox(height: 30),

          // Progress details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: const [
                _ProgressRow(label: 'Workouts', value: '9'),
                SizedBox(height: 10),
                _ProgressRow(label: 'Duration', value: '7h 30m'),
                SizedBox(height: 10),
                _ProgressRow(label: 'Calories', value: '1420 kcal'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressRow extends StatelessWidget {
  final String label;
  final String value;

  const _ProgressRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
