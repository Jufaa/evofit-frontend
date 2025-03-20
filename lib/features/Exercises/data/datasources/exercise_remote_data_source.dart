import 'package:frontend/features/Exercises/data/models/exercise_model.dart';

abstract class ExerciseRemoteDataSource {
  Future<ExerciseModel> getOneExercise(String id);
  Future<List<ExerciseModel>> getAllExercise();
  Future<ExerciseModel> createExercise(ExerciseModel exercise);
  Future<ExerciseModel> updateExercise(ExerciseModel exercise);
  Future<bool> deleteExercise(String id);
}

class ExerciseRemoteDataSourceImpl implements ExerciseRemoteDataSource {
  @override
  Future<ExerciseModel> getOneExercise(String id) {
    throw UnimplementedError();
  }

  @override
  Future<ExerciseModel> createExercise(ExerciseModel exercise) {
    // TODO: implement createExercise
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteExercise(String id) {
    // TODO: implement deleteExercise
    throw UnimplementedError();
  }

  @override
  Future<List<ExerciseModel>> getAllExercise() {
    // TODO: implement getAllExercise
    throw UnimplementedError();
  }

  @override
  Future<ExerciseModel> updateExercise(ExerciseModel exercise) {
    // TODO: implement updateExercise
    throw UnimplementedError();
  }
}
