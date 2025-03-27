import 'package:frontend/features/Exercises/domain/entities/exercise.dart';
import 'package:frontend/features/Exercises/domain/repositories/exercise_repository.dart';

class UpdateExerciseUseCase {
  final ExerciseRepository repository;

  UpdateExerciseUseCase({required this.repository});

  call(String id, String nameExercise, String description, String muscleGroup) {
    var exercise = Exercise(
      name_exercise: nameExercise,
      description: description,
      muscle_group: muscleGroup,
    );
    return repository.updateExercise(id, exercise);
  }
}
