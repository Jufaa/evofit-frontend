import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/User/data/datasources/user_remote_data_source.dart';
import 'package:frontend/features/User/data/models/user_model.dart';
import 'package:frontend/features/User/domain/repositories/user_repository.dart';

class ServerFailure extends Failure {
  final String? message;

  ServerFailure({this.message});
}

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
    DateTime birthdate,
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
    } on DioException catch (e) {
      // Imprimir los detalles de la excepción para más información
      print('DioException: ${e.message}');
      print('DioException Response: ${e.response}');

      // Verificar si la respuesta contiene información más específica
      if (e.response != null) {
        // Acceder a detalles de la respuesta del servidor
        print('Status code: ${e.response?.statusCode}');
        print('Response data: ${e.response?.data}');
      }

      // Devolver un error genérico o más detallado dependiendo del caso
      return Left(
        ServerFailure(message: e.message),
      ); // Puedes pasar el mensaje de error al Failure
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInUser(
    String username,
    String password,
  ) async {
    try {
      final UserModel user = await userRemoteDataSources.signInUser(
        username,
        password,
      );

      return Right(user);
    } on DioException catch (e) {
      // Imprimir los detalles de la excepción para más información
      print('DioException: ${e.message}');
      print('DioException Response: ${e.response}');

      // Verificar si la respuesta contiene información más específica
      if (e.response != null) {
        // Acceder a detalles de la respuesta del servidor
        print('Status code: ${e.response?.statusCode}');
        print('Response data: ${e.response?.data}');
      }

      // Devolver un error genérico o más detallado dependiendo del caso
      return Left(
        ServerFailure(message: e.message),
      ); // Puedes pasar el mensaje de error al Failure
    }
  }
}
