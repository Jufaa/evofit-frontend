import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/User/data/datasources/user_remote_data_source.dart';
import 'package:frontend/features/User/data/models/user_model.dart';
import 'package:frontend/features/User/domain/repositories/UserRepository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSources userRemoteDataSources;

  UserRepositoryImpl({required this.userRemoteDataSources});

  @override
  Future<Either<Failure, UserModel>> createUser(
    String email,
    String password,
    String username,
    String firstName,
    String lastName,
    String birthdate,
  ) async {
    try {
      final UserModel user = await userRemoteDataSources.createUser(
        email,
        password,
        username,
        firstName,
        lastName,
        birthdate,
      );

      return Right(user);
    } on DioException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInUser(
    String email,
    String password,
  ) async {
    try {
      final UserModel user = await userRemoteDataSources.signInUser(
        email,
        password,
      );

      return Right(user);
    } on DioException {
      return Left(ServerFailure());
    }
  }
}
