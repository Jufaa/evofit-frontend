import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Exercises/domain/entities/exercise.dart';
import 'package:frontend/features/Exercises/domain/repositories/exercise_repository.dart';

class GetAllExerciseUseCase {
  final ExerciseRepository exerciseRepository;

  GetAllExerciseUseCase({required this.exerciseRepository});

  Future<Either<Failure, List<Exercise>>> call() {
    return exerciseRepository.getAllExercise();
  }
}
