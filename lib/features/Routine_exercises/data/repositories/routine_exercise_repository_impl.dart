import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Routine/domain/entities/Routine.dart';
import 'package:frontend/features/Routine_exercises/data/datasources/routine_exercises_remote_data_source.dart';
import 'package:frontend/features/Routine_exercises/domain/repositories/routine_exercises_repository.dart';

class RoutineExerciseRepositoryImpl implements RoutineExerciseRepository {
  final RoutineExercisesRemoteDataSource routineExercisesRemoteDataSource;

  RoutineExerciseRepositoryImpl({
    required this.routineExercisesRemoteDataSource,
  });

  @override
  Future<Either<Failure, Routine>> addRoutineExercise(Routine routineExercise) {
    // TODO: implement addRoutineExercise
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deleteRoutineExercise(int routineExerciseId) {
    // TODO: implement deleteRoutineExercise
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Routine>> editRoutineExercise(
    int routineExerciseId,
    Routine updatedData,
  ) {
    // TODO: implement editRoutineExercise
    throw UnimplementedError();
  }
}
