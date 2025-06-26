import 'package:dio/dio.dart';
import 'package:frontend/features/Main_muscle/data/models/main_muscleModel.dart';

abstract class MainMuscleRemoteDataSources {
  Future<List<MainMuscleModel>> getAllMainMuscle();
  Future<MainMuscleModel> getMainMuscleById(int mainMuscleId);
}

class MainMuscleRemoteDataSourceImpl implements MainMuscleRemoteDataSources {
  final Dio dio = Dio();

  @override
  Future<List<MainMuscleModel>> getAllMainMuscle() async {
    try {
      final resp = await dio.get('http://10.0.2.2:3000/mainMuscle/all');

      return (resp.data as List)
          .map((e) => MainMuscleModel.fromJson(e))
          .toList();
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

  @override
  Future<MainMuscleModel> getMainMuscleById(int mainMuscleId) async {
    try {
      final resp = await dio.get(
        'http://10.0.2.2:3000/mainMuscle/$mainMuscleId',
      );

      return MainMuscleModel.fromJson(resp.data);
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
