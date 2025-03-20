import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Exercises/data/datasources/exercise_remote_data_source.dart';
import 'package:frontend/features/Exercises/domain/entities/Exercise.dart';
import 'package:frontend/features/Exercises/domain/repositories/ExerciseRepository.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseRemoteDataSource exerciseRemoteDataSource;

  ExerciseRepositoryImpl({required this.exerciseRemoteDataSource});

  @override
  Future<Either<Failure, bool>> deleteExercise(String id) async {
    try {
      final bool result = await exerciseRemoteDataSource.deleteExercise(id);
      return Right(result);
    } on Exception {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Exercise>> createExercise(Exercise exercise) {
    // TODO: implement createExercise
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Exercise>> getAllExercise() {
    // TODO: implement getAllExercise
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Exercise>> getOneExercise(String id) {
    // TODO: implement getOneExercise
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Exercise>> updateExercise(
    String id,
    Exercise exercise,
  ) {
    // TODO: implement updateExercise
    throw UnimplementedError();
  }
}
