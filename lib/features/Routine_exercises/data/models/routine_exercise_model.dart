import 'package:frontend/features/Routine_exercises/domain/entities/routine_exercises.dart';

class RoutineExerciseModel extends RoutineExercise {
  RoutineExerciseModel({
    required int routine_id,
    required int exercise_id,
    required int sets,
    required int reps,
    required int weight,
  }) : super(
         routine_id: routine_id,
         exercise_id: exercise_id,
         sets: sets,
         reps: reps,
         weight: weight,
       );

  factory RoutineExerciseModel.fromJson(Map<String, dynamic> json) {
    return RoutineExerciseModel(
      routine_id: json['routine_id'],
      exercise_id: json['exercise_id'],
      sets: json['sets'],
      reps: json['reps'],
      weight: json['weight'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'routine_exercise_id': routine_exercise_id,
      'routine_id': routine_id,
      'exercise_id': exercise_id,
      'sets': sets,
      'reps': reps,
      'weight': weight,
    };
  }

  factory RoutineExerciseModel.fromEntity(RoutineExercise routineExercise) {
    return RoutineExerciseModel(
      routine_id: routineExercise.routine_id,
      exercise_id: routineExercise.exercise_id,
      sets: routineExercise.sets,
      reps: routineExercise.reps,
      weight: routineExercise.weight,
    );
  }
}
