import 'package:dio/dio.dart';
import 'package:frontend/features/Routine/data/models/routine_model.dart';
import 'package:frontend/features/Routine_exercises/data/models/routine_exercise_model.dart';

abstract class RoutineExercisesRemoteDataSource {
  Future<RoutineExerciseModel> addRoutineExercise(
    int routineId,
    int exerciseId,
    int sets,
    int reps,
    int weight,
  );
  Future<RoutineExerciseModel> deleteRoutineExercise(int routineExerciseId);
  Future<RoutineExerciseModel> editRoutineExercise(
    int routineExerciseId,
    RoutineModel updatedData,
  );
  Future<RoutineExerciseModel> existsRoutineExercise(int id);
  Future<List<RoutineExerciseModel>> getAllRoutineExercisesById(
    int id,
  ); //TODO: esta raro este mirarlo
  Future<RoutineExerciseModel> getRoutineExerciseById(int id);
}

class RoutineExerciseRemoteDataSourceImpl
    implements RoutineExercisesRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<RoutineExerciseModel> addRoutineExercise(
    int routineId,
    int exerciseId,
    int sets,
    int reps,
    int weight,
  ) async {
    try {
      final response = await dio.post(
        'https://10.0.2.2:3000/routine_exercises',
        data: {
          'routine_id': routineId,
          'exercise_id': exerciseId,
          'sets': sets,
          'reps': reps,
          'weight': weight,
        },
      );
      return RoutineExerciseModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to add routine exercise: $e');
    }
  }

  @override
  Future<RoutineExerciseModel> deleteRoutineExercise(
    int routineExerciseId,
  ) async {
    try {
      final response = await dio.delete(
        'https://10.0.2.2:3000/routine_exercises/$routineExerciseId',
      );
      return RoutineExerciseModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to delete routine exercise: $e');
    }
  }

  @override
  Future<RoutineExerciseModel> editRoutineExercise(
    int routineExerciseId,
    RoutineModel updatedData,
  ) async {
    try {
      final response = await dio.put(
        'https://10.0.2.2:3000/routine_exercises/$routineExerciseId',
        data: updatedData.toJson(),
      );
      return RoutineExerciseModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to edit routine exercise: $e');
    }
  }

  @override
  Future<RoutineExerciseModel> existsRoutineExercise(int id) async {
    try {
      final response = await dio.get(
        'https://10.0.2.2:3000/routine_exercises/$id/exists',
      );
      return RoutineExerciseModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to check if routine exercise exists: $e');
    }
  }

  @override
  Future<List<RoutineExerciseModel>> getAllRoutineExercisesById(int id) async {
    try {
      final response = await dio.get(
        'https://10.0.2.2:3000/routine_exercises/routine/$id',
      );
      return (response.data as List)
          .map((item) => RoutineExerciseModel.fromJson(item))
          .toList();
    } catch (e) {
      throw Exception('Failed to get all routine exercises by ID: $e');
    }
  }

  @override
  Future<RoutineExerciseModel> getRoutineExerciseById(int id) async {
    try {
      final response = await dio.get(
        'https://10.0.2.2:3000/routine_exercises/$id',
      );
      return RoutineExerciseModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get routine exercise by ID: $e');
    }
  }
}
