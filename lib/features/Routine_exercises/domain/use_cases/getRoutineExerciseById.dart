import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Routine/domain/entities/Routine.dart';
import 'package:frontend/features/Routine_exercises/domain/repositories/routine_exercises_repository.dart';

class GetRoutineExerciseByIdUseCase {
  final RoutineExerciseRepository routineExerciserRepository;

  GetRoutineExerciseByIdUseCase({required this.routineExerciserRepository});

  Future<Either<Failure, Routine>> call(int id) async {
    return await routineExerciserRepository.getRoutineExerciseById(id);
  }
}
