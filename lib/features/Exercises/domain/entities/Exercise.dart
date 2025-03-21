// ignore_for_file: non_constant_identifier_names

import 'package:frontend/features/Routine_exercises/domain/entities/Routine_exercises.dart';

class Exercise {
  String? exercise_id;
  String name_exercise;
  String description;
  String muscle_group;
  List<RoutineExercise>? routine_exercises;

  Exercise({
    this.exercise_id,
    required this.name_exercise,
    required this.description,
    required this.muscle_group,
    this.routine_exercises,
  });
}
