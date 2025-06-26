import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Main_muscle/data/datasources/mainMuslce_remote_data_source.dart';
import 'package:frontend/features/Main_muscle/domain/entities/main_muscle.dart';
import 'package:frontend/features/Main_muscle/domain/repositories/mainMuscle_repositories.dart';

class ServerFailure extends Failure {
  final String? message;

  ServerFailure({this.message});
}

class MainMuscleRepositoryImpl implements MainMuscleRepository {
  final MainMuscleRemoteDataSources mainMuscleRemoteDataSources;

  MainMuscleRepositoryImpl({required this.mainMuscleRemoteDataSources});

  @override
  Future<Either<Failure, List<MainMuscle>>> getAllMainMuscle() async {
    try {
      final List<MainMuscle> mainMuscles =
          await mainMuscleRemoteDataSources.getAllMainMuscle();
      return Right(mainMuscles);
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
  Future<Either<Failure, MainMuscle>> getMainMuscleById(
    int mainMuscleId,
  ) async {
    try {
      final MainMuscle mainMuscle = await mainMuscleRemoteDataSources
          .getMainMuscleById(mainMuscleId);
      return Right(mainMuscle);
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
