// ignore_for_file: non_constant_identifier_names

class Exercise {
  String? exercise_id;
  String name_exercise;
  String description;
  String muscle_group;
  //List<RoutineExercise>? routine_exercises;

  Exercise({
    this.exercise_id,
    required this.name_exercise,
    required this.description,
    required this.muscle_group,
    //this.routine_exercises,
  });
}
