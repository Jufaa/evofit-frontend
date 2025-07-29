import 'package:dio/dio.dart';
import 'package:frontend/features/Routine/data/models/routine_model.dart';

abstract class RoutineRemoteDataSource {
  Future<RoutineModel> createRoutine(
    String name,
    int weeks,
    int days,
    int userId,
  );

  Future<RoutineModel> getRoutineById(int id);
  Future<List<RoutineModel>> getAllRoutinesByUserId(int id);
  Future<bool> deleteRoutine(int id);
}

class RoutineRemoteDataSourceImpl implements RoutineRemoteDataSource {
  final Dio dio = Dio();
  @override
  Future<RoutineModel> createRoutine(
    String name,
    int weeks,
    int days,
    int userId,
  ) async {
    try {
      final resp = await dio.post(
        'http://10.0.2.2:3000/routine/create',
        data: {
          'name_routine': name,
          'weeks': weeks,
          'days': days,
          'user_id': userId,
        },
      );
      return RoutineModel.fromJson(resp.data);
    } catch (e) {
      print('Error en la solicitud: $e');
      rethrow;
    }
  }

  @override
  Future<RoutineModel> getRoutineById(int id) async {
    try {
      final resp = await dio.get('http://10.0.2.2:3000/routine/$id');
      if (resp.statusCode == 200) {
        return RoutineModel.fromJson(resp.data);
      } else {
        throw Exception('Error al obtener la rutina: ${resp.statusCode}');
      }
    } catch (e) {
      print('Error en la solicitud: $e');
      rethrow;
    }
  }

  @override
  Future<List<RoutineModel>> getAllRoutinesByUserId(int id) async {
    try {
      final resp = await dio.get('http://10.0.2.2:3000/routine/$id/all');
      if (resp.statusCode == 200) {
        List<RoutineModel> routines =
            (resp.data as List)
                .map((routine) => RoutineModel.fromJson(routine))
                .toList();
        return routines;
      } else {
        throw Exception('Error al obtener las rutinas: ${resp.statusCode}');
      }
    } catch (e) {
      print('Error en la solicitud: $e');
      rethrow;
    }
  }

  @override
  Future<bool> deleteRoutine(int id) async {
    try {
      final resp = await dio.put('http://10.0.2.2:3000/routine/$id/delete');
      if (resp.statusCode == 200) {
        return true;
      } else {
        throw Exception('Error al eliminar la rutina: ${resp.statusCode}');
      }
    } catch (e) {
      print('Error en la solicitud: $e');
      rethrow;
    } finally {
      dio.close();
    }
  }
}
