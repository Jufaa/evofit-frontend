import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Routine/domain/entities/routine.dart';

abstract class RoutineRepository {
  Future<Either<Failure, Routine>> createRoutine(
    String name,
    int weeks,
    int days,
    int userId,
  );

  Future<Either<Failure, Routine>> getRoutineById(int id);

  Future<Either<Failure, List<Routine>>> getAllRoutinesByUserId(int userId);

  Future<Either<Failure, bool>> deleteRoutine(int id);
}
