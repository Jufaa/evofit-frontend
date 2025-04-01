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
}
