import 'package:dio/dio.dart';
import 'package:frontend/features/User/data/models/user_model.dart';

abstract class UserRemoteDataSources {
  Future<UserModel> createUser(
    String email,
    String password,
    String username,
    String firstName,
    String lastName,
    DateTime birthdate,
  );
  Future<UserModel> signInUser(String email, String password);
}

class UserRemoteDataSourcesImpl implements UserRemoteDataSources {
  final Dio dio = Dio();
  @override
  Future<UserModel> createUser(
    String email,
    String password,
    String username,
    String firstName,
    String lastName,
    DateTime birthdate,
  ) async {
    try {
      print('EMAIL: $email');
      print('PASSWORD: $password');
      print('USERNAME: $username');
      print('FIRSTNAME: $firstName');
      print('LASTNAME: $lastName');
      print('BIRTHDATE: $birthdate');

      final resp = await dio.post(
        'http://10.0.2.2:3000/auth/register',
        data: {
          'email': email,
          'password': password,
          'username': username,
          'firstName': firstName,
          'lastName': lastName,
          'role': 'user',
          'birthdate': birthdate.toIso8601String(),
        },
      );
      print('RESP USER REMOTE DATA: ${resp.data}');

      // Aquí usamos resp.data, que es el Map que podemos pasar a fromJson
      return UserModel.fromJson(resp.data);
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

  @override
  Future<UserModel> signInUser(String username, String password) async {
    try {
      final resp = await dio.post(
        'http://10.0.2.2:3000/auth/login',
        data: {'username': username, 'password': password},
      );

      // Asegúrate de acceder a resp.data, que contiene el cuerpo de la respuesta
      print('RESP USER REMOTE DATA: ${resp.data}');

      // Aquí usamos resp.data, que es el Map que podemos pasar a fromJson
      return UserModel.fromJson(resp.data);
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
