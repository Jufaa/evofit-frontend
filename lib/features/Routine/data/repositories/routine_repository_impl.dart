import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Routine/data/datasources/routine_remote_data_source.dart';
import 'package:frontend/features/Routine/domain/entities/Routine.dart';
import 'package:frontend/features/Routine/domain/repositories/routine_repository.dart';

class RoutineRepositoryImpl extends RoutineRepository {
  final RoutineRemoteDataSource remoteDataSource;

  RoutineRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Routine>> createRoutine(
    int profileId,
    String name,
    List<Routine> exercises,
  ) {
    // TODO: implement createRoutine
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> delRoutine(int routineId) {
    // TODO: implement delRoutine
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> existsRoutine(int routineId) {
    // TODO: implement existsRoutine
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Routine>>> getAllRoutinesByUserId(int userId) {
    // TODO: implement getAllRoutinesByUserId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Routine>> getRoutineById(int routineId) {
    // TODO: implement getRoutineById
    throw UnimplementedError();
  }
}
