// ignore_for_file: non_constant_identifier_names

class RoutineExercise {
  int? routine_exercise_id;
  int routine_id;
  int exercise_id;
  int sets;
  int reps;
  int weight;

  RoutineExercise({
    this.routine_exercise_id,
    required this.routine_id,
    required this.exercise_id,
    required this.sets,
    required this.reps,
    required this.weight,
  });
}
