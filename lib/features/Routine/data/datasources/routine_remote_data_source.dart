import 'package:dio/dio.dart';
import 'package:frontend/features/Routine/data/models/routine_model.dart';

abstract class RoutineRemoteDataSource {
  Future<RoutineModel> createRoutine(
    String name,
    int weeks,
    int days,
    int user_id,
  );
}

class RoutineRemoteDataSourceImpl implements RoutineRemoteDataSource {
  final Dio dio = Dio();
  @override
  Future<RoutineModel> createRoutine(
    String name,
    int weeks,
    int days,
    int user_id,
  ) async {
    try {
      final resp = await dio.post(
        'http://10.0.2.2:3000/routine/create',
        data: {
          'name_routine': name,
          'weeks': weeks,
          'days': days,
          'user_id': user_id,
        },
      );
      return RoutineModel.fromJson(resp.data);
    } catch (e) {
      print('Error en la solicitud: $e');
      rethrow;
    }
  }
}
