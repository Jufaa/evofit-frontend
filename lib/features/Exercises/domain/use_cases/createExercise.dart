import 'package:frontend/features/Exercises/domain/entities/exercise.dart';
import 'package:frontend/features/Exercises/domain/repositories/exercise_repository.dart';

class CreateExerciseUseCase {
  final ExerciseRepository repository;

  CreateExerciseUseCase({required this.repository});

  call(String nameExercise, String description, String muscleGroup) {
    var exercise = Exercise(
      name_exercise: nameExercise,
      description: description,
      muscle_group: muscleGroup,
    );
    return repository.createExercise(exercise);
  }
}
