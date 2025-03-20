import 'package:frontend/features/Exercises/domain/repositories/ExerciseRepository.dart';

class GetAllExerciseUseCase {
  final ExerciseRepository repository;

  GetAllExerciseUseCase({required this.repository});

  call() {
    return repository.getAllExercise();
  }
}
