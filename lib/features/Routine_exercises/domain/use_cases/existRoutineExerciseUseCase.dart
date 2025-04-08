import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Routine_exercises/domain/repositories/routine_exercises_repository.dart';

class ExistRoutineExerciseUseCase {
  final RoutineExerciseRepository routineExerciseRepository;

  ExistRoutineExerciseUseCase({required this.routineExerciseRepository});

  Future<Either<Failure, bool>> call(int id) async {
    return await routineExerciseRepository.existsRoutineExercise(id);
  }
}
