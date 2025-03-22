import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Routine/domain/entities/Routine.dart';

abstract class RoutineRepository {
  // Check this no se si esta bien, no se si es el routine exercise o el routine
  Future<Either<Failure, List<Routine>>> getAllRoutinesByUserId(int userId);
  Future<Either<Failure, Routine>> getRoutineById(int routineId);
  Future<Either<Failure, bool>> existsRoutine(int routineId);
  Future<Either<Failure, Routine>> createRoutine(
    int profileId,
    String name,
    List<Routine> exercises,
  );
  Future<Either<Failure, bool>> delRoutine(int routineId);
}
