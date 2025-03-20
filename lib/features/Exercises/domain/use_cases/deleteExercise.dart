import 'package:frontend/features/Exercises/domain/repositories/ExerciseRepository.dart';

class DeleteExerciseUseCase {
  final ExerciseRepository repository;

  DeleteExerciseUseCase({required this.repository});

  call(String id) {
    return repository.deleteExercise(id);
  }
}
