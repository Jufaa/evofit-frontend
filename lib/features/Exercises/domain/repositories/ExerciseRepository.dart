import 'package:dartz/dartz.dart';
import 'package:frontend/core/error/failures.dart';
import 'package:frontend/features/Exercises/domain/entities/Exercise.dart';

abstract class ExerciseRepository {
  Future<Either<Failure, Exercise>> createExercise(Exercise exercise);
  Future<Either<Failure, bool>> deleteExercise(String id);
  Future<Either<Failure, Exercise>> updateExercise(
    String id,
    Exercise exercise,
  );
  Future<Either<Failure, Exercise>> getOneExercise(String id);
  Future<Either<Failure, Exercise>> getAllExercise();
}
