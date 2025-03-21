// ignore_for_file: non_constant_identifier_names

import 'package:frontend/features/Routine_exercises/domain/entities/Routine_exercises.dart';
import 'package:frontend/features/User/domain/entities/User.dart';

class Routine {
  int? routine_id;
  String name_routine;
  int user_id;
  User? user;
  List<RoutineExercise>? routine_exercises;

  Routine({
    this.routine_id,
    required this.name_routine,
    required this.user_id,
    this.user,
    this.routine_exercises,
  });
}
