import 'package:frontend/features/Exercises/domain/entities/exercise.dart';
import 'package:frontend/features/Exercises/domain/repositories/exercise_repository.dart';

class CreateExerciseUseCase {
  final ExerciseRepository repository;

  CreateExerciseUseCase({required this.repository});

  call(String name_exercise, String description, String muscle_group) {
    var exercise = Exercise(
      name_exercise: name_exercise,
      description: description,
      muscle_group: muscle_group,
    );
    return repository.createExercise(exercise);
  }
}
