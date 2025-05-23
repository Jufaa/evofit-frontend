import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Routine_exercises/domain/entities/routine_exercises.dart';
import 'package:frontend/features/Routine_exercises/domain/repositories/routine_exercises_repository.dart';

class GetAllRoutineExerciserByIdUseCase {
  final RoutineExerciseRepository routineExerciseRepository;

  GetAllRoutineExerciserByIdUseCase({required this.routineExerciseRepository});

  Future<Either<Failure, List<RoutineExercise>>> call(int id) async {
    return await routineExerciseRepository.getAllRoutineExercisesById(id);
  }
}
