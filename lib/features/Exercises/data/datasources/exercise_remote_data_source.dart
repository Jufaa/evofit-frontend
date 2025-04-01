import 'package:dio/dio.dart';
import 'package:frontend/features/Exercises/data/models/exercise_model.dart';

abstract class ExerciseRemoteDataSource {
  Future<List<ExerciseModel>> getAllExercises();
}

class ExerciseRemoteDataSourceImpl implements ExerciseRemoteDataSource {
  final Dio dio = Dio();
  @override
  Future<List<ExerciseModel>> getAllExercises() async {
    try {
      final resp = await dio.get('http://10.0.2.2:3000/exercise/all');

      return (resp.data as List)
          .map((exercise) => ExerciseModel.fromJson(exercise))
          .toList();
    } catch (e) {
      print('Error en la solicitud: $e');
      rethrow;
    }
  }
}
