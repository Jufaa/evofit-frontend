import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Exercises/data/datasources/exercise_remote_data_source.dart';
import 'package:frontend/features/Exercises/data/models/exercise_model.dart';
import 'package:frontend/features/Exercises/domain/repositories/exercise_repository.dart';

class ServerFailure extends Failure {
  final String message;

  ServerFailure({required this.message});
}

class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseRemoteDataSource exerciseRemoteDataSources;

  ExerciseRepositoryImpl({required this.exerciseRemoteDataSources});

  @override
  Future<Either<Failure, List<ExerciseModel>>> getAllExercise() async {
    try {
      final List<ExerciseModel> exercises =
          await exerciseRemoteDataSources.getAllExercises();
      return Right(exercises);
    } on DioException catch (e) {
      return Left(
        ServerFailure(message: e.message ?? 'Unknown error occurred'),
      );
    }
  }
}
