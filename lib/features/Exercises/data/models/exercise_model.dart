import 'package:frontend/features/Exercises/domain/entities/exercise.dart';

class ExerciseModel extends Exercise {
  ExerciseModel({
    required super.name,
    required super.description,
    required super.main_muscle_id,
  });

  factory ExerciseModel.fromJson(json) {
    return ExerciseModel(
      name: json['name'],
      description: json['description'],
      main_muscle_id: json['main_muscle_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'main_muscle_id': main_muscle_id,
    };
  }

  factory ExerciseModel.fromEntity(Exercise exercise) {
    return ExerciseModel(
      name: exercise.name,
      description: exercise.description,
      main_muscle_id: exercise.main_muscle_id,
    );
  }
}
