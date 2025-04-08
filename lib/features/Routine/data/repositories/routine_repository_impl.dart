import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Routine/data/datasources/routine_remote_data_source.dart';
import 'package:frontend/features/Routine/domain/entities/Routine.dart';
import 'package:frontend/features/Routine/domain/repositories/routine_repository.dart';

class ServerFailure extends Failure {
  final String message;

  ServerFailure({required this.message});
}

class RoutineRepositoryImpl extends RoutineRepository {
  final RoutineRemoteDataSource remoteDataSource;

  RoutineRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Routine>> createRoutine(
    String name,
    int weeks,
    int days,
    int user_id,
  ) async {
    try {
      final Routine routine = await remoteDataSource.createRoutine(
        name,
        weeks,
        days,
        user_id,
      );
      return Right(routine);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Routine>> getRoutineById(int id) async {
    try {
      final Routine routine = await remoteDataSource.getRoutineById(id);
      return Right(routine);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Routine>>> getAllRoutinesByUserId(
    int user_id,
  ) async {
    try {
      final List<Routine> routines = await remoteDataSource
          .getAllRoutinesByUserId(user_id);
      return Right(routines);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteRoutine(int id) async {
    try {
      final bool result = await remoteDataSource.deleteRoutine(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
