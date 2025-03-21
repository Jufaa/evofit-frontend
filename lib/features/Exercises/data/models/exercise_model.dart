import 'package:frontend/features/Exercises/domain/entities/exercise.dart';

class ExerciseModel extends Exercise {
  ExerciseModel({
    required super.name_exercise,
    required super.description,
    required super.muscle_group,
  });

  factory ExerciseModel.fromJson(json) {
    return ExerciseModel(
      name_exercise: json['name_exercise'],
      description: json['description'],
      muscle_group: json['muscle_group'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name_exercise': name_exercise,
      'description': description,
      'muscle_group': muscle_group,
    };
  }

  factory ExerciseModel.fromEntity(Exercise exercise) {
    return ExerciseModel(
      name_exercise: exercise.name_exercise,
      description: exercise.description,
      muscle_group: exercise.muscle_group,
    );
  }
}
