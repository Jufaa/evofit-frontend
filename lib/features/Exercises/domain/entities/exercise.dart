// ignore_for_file: non_constant_identifier_names

import 'package:frontend/features/Main_muscle/domain/entities/main_muscle.dart';

class Exercise {
  int? exercise_id;
  String name;
  String description;
  int main_muscle_id;

  Exercise({
    required this.name,
    required this.description,
    required this.main_muscle_id,
  });
}
