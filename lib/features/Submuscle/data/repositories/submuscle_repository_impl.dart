import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Submuscle/data/datasources/submuscle_remote_data_source.dart';
import 'package:frontend/features/Submuscle/domain/entities/subMuscle.dart';
import 'package:frontend/features/Submuscle/domain/repositories/submuscle_repository.dart';

class ServerFailure extends Failure {
  final String? message;

  ServerFailure({this.message});
}

class SubMuscleRepositoryImpl implements SubMuscleRepository {
  final SubMuscleRemoteDataSource subMuscleRemoteDataSource;

  SubMuscleRepositoryImpl({required this.subMuscleRemoteDataSource});

  @override
  Future<Either<Failure, SubMuscle>> getSubMuscleByMainMuscle(int id) async {
    try {
      final SubMuscle subMuscle = await subMuscleRemoteDataSource
          .getSubMuscleByMainMuscle(id);
      return Right(subMuscle);
    } on ServerFailure catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
