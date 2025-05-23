import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Routine/domain/entities/routine.dart';
import 'package:frontend/features/Routine_exercises/domain/repositories/routine_exercises_repository.dart';

class EditRoutineExerciseUseCase {
  final RoutineExerciseRepository routineExerciseRepository;

  EditRoutineExerciseUseCase({required this.routineExerciseRepository});

  Future<Either<Failure, Routine>> call(
    int routineExerciseId,
    Routine updatedData,
  ) {
    return routineExerciseRepository.editRoutineExercise(
      routineExerciseId,
      updatedData,
    );
  }
}
