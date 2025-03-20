import 'package:frontend/features/Exercises/domain/entities/Exercise.dart';
import 'package:frontend/features/Exercises/domain/repositories/ExerciseRepository.dart';

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
