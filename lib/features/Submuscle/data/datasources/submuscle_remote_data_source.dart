import 'package:dio/dio.dart';
import 'package:frontend/features/Submuscle/data/models/subMuscleModel.dart';

abstract class SubMuscleRemoteDataSource {
  Future<SubmuscleModel> getSubMuscleByMainMuscle(int id);
}

class SubMuscleRemoteDataSourceImpl implements SubMuscleRemoteDataSource {
  final Dio dio = Dio();
  @override
  Future<SubmuscleModel> getSubMuscleByMainMuscle(int id) async {
    try {
      final resp = await dio.get(
        'http://10.0.2.2:3000/submuscle/$id',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      return SubmuscleModel.fromJson(resp.data);
    } on DioException catch (e) {
      if (e.response != null) {
        print(
          'Error en la solicitud: ${e.response?.statusCode} - ${e.response?.data}',
        );
      } else {
        print('Error de conexión: ${e.message}');
      }
      rethrow;
    }
  }
}
