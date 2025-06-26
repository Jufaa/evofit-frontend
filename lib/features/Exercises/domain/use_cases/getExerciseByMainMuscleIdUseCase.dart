import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Exercises/domain/entities/exercise.dart';
import 'package:frontend/features/Exercises/domain/repositories/exercise_repository.dart';

class GetExerciseByMainMuscleIdUseCase {
  final ExerciseRepository exerciseRepository;

  GetExerciseByMainMuscleIdUseCase({required this.exerciseRepository});

  Future<Either<Failure, Exercise>> call(int mainMuscleId) async {
    return await exerciseRepository.getExerciseByMainMuscleId(mainMuscleId);
  }
}
