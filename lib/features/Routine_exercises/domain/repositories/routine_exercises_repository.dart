import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Routine/domain/entities/Routine.dart';

abstract class RoutineExerciseRepository {
  Future<Either<Failure, Routine>> getRoutineExerciseById(
    int routineExerciseId,
  );
  Future<Either<Failure, Routine>> addRoutineExercise(Routine routineExercise);
  Future<Either<Failure, Routine>> editRoutineExercise(
    int routineExerciseId,
    Routine updatedData,
  );
  Future<Either<Failure, bool>> deleteRoutineExercise(int routineExerciseId);
  Future<Either<Failure, List<Routine>>> getAllRoutineExercises();
  Future<Either<Failure, List<Routine>>> getRoutineExercisesByRoutineId(
    int routineId,
  );
  Future<Either<Failure, bool>> existsRoutineExercise(int routineExerciseId);
}
