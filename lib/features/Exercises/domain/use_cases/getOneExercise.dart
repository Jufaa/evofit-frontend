import 'package:frontend/features/Exercises/domain/repositories/ExerciseRepository.dart';

class GetOneExerciseUseCase {
  final ExerciseRepository repository;

  GetOneExerciseUseCase({required this.repository});

  call(String id) {
    return repository.getOneExercise(id);
  }
}
