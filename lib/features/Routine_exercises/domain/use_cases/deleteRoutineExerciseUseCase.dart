import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Routine_exercises/domain/repositories/routine_exercises_repository.dart';

class DeleteRoutineExerciseUseCase {
  final RoutineExerciseRepository routineExerciseRepository;

  DeleteRoutineExerciseUseCase({required this.routineExerciseRepository});

  Future<Either<Failure, bool>> call(int id) async {
    return await routineExerciseRepository.deleteRoutineExercise(id);
  }
}
