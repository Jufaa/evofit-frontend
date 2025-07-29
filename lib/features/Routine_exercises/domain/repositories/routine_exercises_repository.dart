import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Routine/domain/entities/routine.dart';
import 'package:frontend/features/Routine_exercises/domain/entities/routine_exercises.dart';

abstract class RoutineExerciseRepository {
  Future<Either<Failure, Routine>> addRoutineExercise(
    int routineId,
    int exerciseId,
    int sets,
    int reps,
    int weight,
  );
  Future<Either<Failure, bool>> deleteRoutineExercise(int routineExerciseId);
  Future<Either<Failure, Routine>> editRoutineExercise(
    int routineExerciseId,
    Routine updatedData,
  );
  Future<Either<Failure, bool>> existsRoutineExercise(int id);
  Future<Either<Failure, List<RoutineExercise>>> getAllRoutineExercisesById(
    int id,
  ); //TODO: esta raro este mirarlo
  Future<Either<Failure, Routine>> getRoutineExerciseById(int id);
}
