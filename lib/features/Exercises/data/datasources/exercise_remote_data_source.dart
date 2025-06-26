import 'package:dio/dio.dart';
import 'package:frontend/features/Exercises/data/models/exercise_model.dart';

abstract class ExerciseRemoteDataSource {
  Future<List<ExerciseModel>> getAllExercises();
  Future<ExerciseModel> getExerciseByMainMuscleId(int mainMuscleId);
}

class ExerciseRemoteDataSourceImpl implements ExerciseRemoteDataSource {
  final Dio dio = Dio();
  @override
  Future<List<ExerciseModel>> getAllExercises() async {
    try {
      final resp = await dio.get('http://10.0.2.2:3000/exercise/all');
      print('RESP EXERCISE REMOTE DATA: ${resp.data}');
      print('RESP EXERCISE REMOTE DATA: ${resp}');
      return (resp.data as List)
          .map((exercise) => ExerciseModel.fromJson(exercise))
          .toList();
    } catch (e) {
      print('Error en la solicitud: $e');
      rethrow;
    }
  }

  @override
  Future<ExerciseModel> getExerciseByMainMuscleId(int mainMuscleId) async {
    try {
      final resp = await dio.get(
        'http://10.0.2.2:3000/exercise/${mainMuscleId}',
      );
      return ExerciseModel.fromJson(resp.data);
    } on DioException catch (e) {
      if (e.response != null) {
        print(
          'Error en la solicitud: ${e.response?.statusCode} - ${e.response?.data}',
        );
      } else {
        print('Error de conexión: ${e.message}');
      }
      rethrow;
    } catch (e) {
      print('Error en la solicitud: $e');
      rethrow;
    }
  }
}
