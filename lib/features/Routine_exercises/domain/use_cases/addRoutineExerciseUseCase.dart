import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Routine/domain/entities/Routine.dart';
import 'package:frontend/features/Routine_exercises/domain/repositories/routine_exercises_repository.dart';

class AddRoutineExerciseUseCase {
  final RoutineExerciseRepository routineExerciseRepository;

  AddRoutineExerciseUseCase({required this.routineExerciseRepository});

  Future<Either<Failure, Routine>> call({
    required int routine_id,
    required int exercise_id,
    required int sets,
    required int reps,
    required int weight,
  }) {
    return routineExerciseRepository.addRoutineExercise(
      routine_id,
      exercise_id,
      sets,
      reps,
      weight,
    );
  }
}
