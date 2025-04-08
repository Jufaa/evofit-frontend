import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Routine/domain/entities/Routine.dart';

abstract class RoutineRepository {
  Future<Either<Failure, Routine>> createRoutine(
    String name,
    int weeks,
    int days,
    int user_id,
  );

  Future<Either<Failure, Routine>> getRoutineById(int id);

  Future<Either<Failure, List<Routine>>> getAllRoutinesByUserId(int user_id);

  Future<Either<Failure, bool>> deleteRoutine(int id);
}
