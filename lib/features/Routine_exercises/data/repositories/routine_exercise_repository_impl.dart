import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Routine/data/models/routine_model.dart';
import 'package:frontend/features/Routine/domain/entities/routine.dart';
import 'package:frontend/features/Routine_exercises/data/datasources/routine_exercises_remote_data_source.dart';
import 'package:frontend/features/Routine_exercises/domain/entities/routine_exercises.dart';
import 'package:frontend/features/Routine_exercises/domain/repositories/routine_exercises_repository.dart';

class ServerFailure extends Failure {
  final String? message;

  ServerFailure({this.message});
}

class RoutineExerciseRepositoryImpl implements RoutineExerciseRepository {
  final RoutineExercisesRemoteDataSource routineExercisesRemoteDataSource;

  RoutineExerciseRepositoryImpl({
    required this.routineExercisesRemoteDataSource,
  });

  @override
  Future<Either<Failure, Routine>> addRoutineExercise(
    int routineId,
    int exerciseId,
    int sets,
    int reps,
    int weight,
  ) async {
    try {
      final Routine routine =
          (await routineExercisesRemoteDataSource.addRoutineExercise(
                routineId,
                exerciseId,
                sets,
                reps,
                weight,
              ))
              as Routine;
      return Right(routine);
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
  Future<Either<Failure, bool>> deleteRoutineExercise(
    int routineExerciseId,
  ) async {
    try {
      final bool result =
          (await routineExercisesRemoteDataSource.deleteRoutineExercise(
                routineExerciseId,
              ))
              as bool;
      return Right(result);
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
  Future<Either<Failure, Routine>> editRoutineExercise(
    int routineExerciseId,
    Routine updatedData,
  ) async {
    try {
      final RoutineModel updatedRoutineModel = RoutineModel.fromEntity(
        updatedData,
      );
      final routine = (await routineExercisesRemoteDataSource
          .editRoutineExercise(routineExerciseId, updatedRoutineModel));

      return Right(routine as Routine);
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
  Future<Either<Failure, bool>> existsRoutineExercise(int id) async {
    try {
      final bool result =
          (await routineExercisesRemoteDataSource.existsRoutineExercise(id))
              as bool;
      return Right(result);
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
  Future<Either<Failure, List<RoutineExercise>>> getAllRoutineExercisesById(
    int id,
  ) async {
    try {
      final List<RoutineExercise> routineExercises =
          (await routineExercisesRemoteDataSource.getAllRoutineExercisesById(
                id,
              ))
              as List<RoutineExercise>;
      return Right(routineExercises);
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
  Future<Either<Failure, Routine>> getRoutineExerciseById(int id) async {
    try {
      final Routine routineExercise =
          (await routineExercisesRemoteDataSource.getRoutineExerciseById(id))
              as Routine;
      return Right(routineExercise);
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
