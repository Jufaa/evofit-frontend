import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Routine/domain/entities/Routine.dart';
import 'package:frontend/features/Routine_exercises/domain/repositories/routine_exercises_repository.dart';

class AddRoutineExerciseUseCase {
  final RoutineExerciseRepository routineExerciseRepository;

  AddRoutineExerciseUseCase({required this.routineExerciseRepository});

  Future<Either<Failure, Routine>> call(Routine routineExercise) {
    return routineExerciseRepository.addRoutineExercise(routineExercise);
  }
}
